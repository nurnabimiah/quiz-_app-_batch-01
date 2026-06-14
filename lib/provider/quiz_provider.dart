import 'package:class_1/api/api_endpoints.dart';
import 'package:class_1/api/api_service.dart';
import 'package:class_1/model/category_response_model.dart';
import 'package:class_1/model/questions_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// State management provider for the Quiz app.
/// Stores list of TriviaCategory for categories and Result for questions.
class QuizProvider extends ChangeNotifier {

  final ApiService _apiService = ApiService();

  List<TriviaCategory> categories = [];
  List<Result> questions = []; // Stores the current set of loaded questions
  bool isLoading = false;
  String? errorMessage;

  Map<int, int> selectedOptions = {};

  /// Select answer in the quiz game session.
  void selectOption(int questionIndex, int optionIndex) {
    selectedOptions[questionIndex] = optionIndex;
    notifyListeners();
  }

  /// Calculate the correct score achieved.
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedOptions.containsKey(i) &&
          selectedOptions[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  /// Reset selection options and answers.
  void resetQuiz() {
    selectedOptions.clear();
    notifyListeners();
  }

  /// GET API: Fetch trivia categories from OpenTDB and store them directly
  /// as TriviaCategory objects from the CategoryResponseModel.
  Future<void> fetchCategories() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.get(ApiEndpoints.openTdbCategoryUrl);
      
      if (response.statusCode == 200) {
        final categoryResponse = CategoryResponseModel.fromJson(response.data);
        categories = categoryResponse.triviaCategories ?? [];
      } else {
        errorMessage = 'Failed to load categories from API.';
      }
    } on DioException catch (err) {
      errorMessage = err.message;
    } catch (e) {
      errorMessage = 'Failed to load categories: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// GET API: Fetch 5 questions for the selected category.
  /// Populates the 'questions' list directly with Result objects.
  /// Returns true on success, false otherwise.
  Future<bool> fetchQuestionsForCategory(TriviaCategory category) async {
    if (category.id == null) return false;

    isLoading = true;
    errorMessage = null;
    questions = []; // Clear previous questions
    notifyListeners();

    try {
      final response = await _apiService.get(
        ApiEndpoints.openTdbQuestionUrl,
        queryParameters: {
          'amount': 5,
          'category': category.id,
        },
      );

      if (response.statusCode == 200) {
        final questionResponse = QuestionResponseModel.fromJson(response.data);
        final int responseCode = questionResponse.responseCode ?? 0;
        
        if (responseCode == 0) {
          questions = questionResponse.results ?? [];
          return true;
        } else {
          errorMessage = 'No questions found for this category.';
          return false;
        }
      } else {
        errorMessage = 'Failed to load questions from API.';
        return false;
      }
    } on DioException catch (err) {
      errorMessage = err.message;
      return false;
    } catch (e) {
      errorMessage = 'Failed to load questions: $e';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}

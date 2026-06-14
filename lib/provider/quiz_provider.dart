
import 'package:class_1/api/api_endpoints.dart';
import 'package:class_1/api/api_service.dart';
import 'package:class_1/model/category_respone_model.dart';
import 'package:flutter/material.dart';

import '../utils/category_class.dart';

class QuizProvider extends ChangeNotifier{

  final ApiService _apiService = ApiService();
  List<TriviaCategory> categories = [];
  bool isLoading = false;
  String? errorMessage;


  Future<void> fetchCategories () async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try{

      final response = await _apiService.get(ApiEndpoints.openTdbCategoryUrl);
      if(response.statusCode == 200){
        final categoryResponse = CategoryResponseModel.fromJson(response.data);
        categories = categoryResponse.triviaCategories ?? [];
      } else{
        errorMessage = "Failed to load categories from APi";
      }
    }catch(e){
      errorMessage = "Failed to load categories : $e";
    } finally{
      isLoading = false;
      notifyListeners();
    }

  }







  // List<CategoryModel> categories = [
  //
  //   CategoryModel(
  //       name: "Science",
  //       icon: Icons.science,
  //       questions: [
  //
  //         QuestionModel(
  //           questions: "What is the capital of Bangladesh?",
  //           options: ["Dhaka", "Chittagong", "Sylhet", "Barisal"],
  //           correctAnswer: 0,
  //         ),
  //
  //
  //         QuestionModel(
  //           questions: "What is the capital of Bangladesh?",
  //           options: ["Dhaka", "Chittagong", "Sylhet", "Barisal"],
  //           correctAnswer: 0,
  //         ),
  //
  //
  //         QuestionModel(
  //           questions: "What is the capital of Bangladesh?",
  //           options: ["Dhaka", "Chittagong", "Sylhet", "Barisal"],
  //           correctAnswer: 0,
  //         )
  //
  //
  //
  //
  //       ]
  //
  //   ),
  //
  //
  //   CategoryModel(
  //       name: "Math",
  //       icon: Icons.calculate,
  //       questions: []
  //   ),
  //
  //   CategoryModel(
  //       name: "Bangla",
  //       icon: Icons.menu_book,
  //       questions: []
  //   )
  //
  // ];


  Map<int,int> selectedOptions = {};

  void selectOption(int questionIndex, int optionIndex) {
    selectedOptions[questionIndex] = optionIndex;
    notifyListeners();
  }


  // result

  int calculateScore ( CategoryModel category){
    int score = 0;
     for(int i = 0; i<category.questions.length; i++){
       if(selectedOptions[i] == category.questions[i].correctAnswer){
         score ++;
       }

     }

    return score;


  }

  // Quiz data reset

   void resetQuiz (){
    selectedOptions.clear();
    notifyListeners();

   }




}

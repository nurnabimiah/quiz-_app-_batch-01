// To parse this JSON data, do
//
//     final questionResponseModel = questionResponseModelFromJson(jsonString);

import 'dart:convert';

QuestionResponseModel questionResponseModelFromJson(String str) => QuestionResponseModel.fromJson(json.decode(str));

String questionResponseModelToJson(QuestionResponseModel data) => json.encode(data.toJson());

class QuestionResponseModel {
  int? responseCode;
  List<Result>? results;

  QuestionResponseModel({
    this.responseCode,
    this.results,
  });

  QuestionResponseModel copyWith({
    int? responseCode,
    List<Result>? results,
  }) =>
      QuestionResponseModel(
        responseCode: responseCode ?? this.responseCode,
        results: results ?? this.results,
      );

  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) => QuestionResponseModel(
    responseCode: json["response_code"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  // Added options and correct index fields to replace runtime QuestionModel
  List<String>? options;
  int? correctAnswerIndex;

  Result({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
    this.options,
    this.correctAnswerIndex,
  });

  Result copyWith({
    String? type,
    String? difficulty,
    String? category,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    List<String>? options,
    int? correctAnswerIndex,
  }) =>
      Result(
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        category: category ?? this.category,
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        options: options ?? this.options,
        correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      );

  factory Result.fromJson(Map<String, dynamic> json) {
    // Decoding helper for cleaner output in UI
    String decode(String text) {
      return text
          .replaceAll('&quot;', '"')
          .replaceAll('&#039;', "'")
          .replaceAll('&amp;', '&')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&deg;', '°')
          .replaceAll('&rsquo;', "'")
          .replaceAll('&ldquo;', '"')
          .replaceAll('&rdquo;', '"')
          .replaceAll('&eacute;', 'é')
          .replaceAll('&oacute;', 'ó')
          .replaceAll('&aacute;', 'á');
    }

    final rawType = json["type"];
    final rawDifficulty = json["difficulty"];
    final rawCategory = json["category"];
    final rawQuestion = json["question"];
    final rawCorrect = json["correct_answer"];
    final rawIncorrect = json["incorrect_answers"] == null 
        ? <String>[] 
        : List<String>.from(json["incorrect_answers"]!.map((x) => x));

    final decodedQuestion = rawQuestion != null ? decode(rawQuestion) : null;
    final decodedCorrect = rawCorrect != null ? decode(rawCorrect) : null;
    final decodedIncorrect = rawIncorrect.map(decode).toList();

    // Shuffle options
    List<String> shuffledChoices = [];
    int correctIndex = -1;
    if (decodedCorrect != null) {
      shuffledChoices = [decodedCorrect, ...decodedIncorrect];
      shuffledChoices.shuffle();
      correctIndex = shuffledChoices.indexOf(decodedCorrect);
    }

    return Result(
      type: rawType,
      difficulty: rawDifficulty,
      category: rawCategory,
      question: decodedQuestion,
      correctAnswer: decodedCorrect,
      incorrectAnswers: decodedIncorrect,
      options: shuffledChoices,
      correctAnswerIndex: correctIndex,
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "difficulty": difficulty,
    "category": category,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": incorrectAnswers == null ? [] : List<dynamic>.from(incorrectAnswers!.map((x) => x)),
  };
}

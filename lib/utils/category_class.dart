


import 'package:flutter/material.dart';

class CategoryModel{
  final String name;
  final IconData icon;
  final List<QuestionModel> questions;

  CategoryModel({required this.name, required this.icon, required this.questions});


}


class QuestionModel {

  final String questions;
  final List<String> options;
  final int correctAnswer;

  QuestionModel({required this.questions,required this.options, required this.correctAnswer});


}


List<CategoryModel> categories = [

  CategoryModel(
      name: "Science",
      icon: Icons.science,
      questions: []
  ),


  CategoryModel(
      name: "Math",
      icon: Icons.calculate,
      questions: []
  ),


  CategoryModel(
      name: "Bangla",
      icon: Icons.menu_book,
      questions: []
  )



];


// class AppData{
//
//   static List<CategoryModel> categories = [
//     CategoryModel(
//         name: "General Knowledge",
//         icon: Icons.public,
//         questions: [
//           QuestionModel(
//               questions: " What is the capital of Bangladesh",
//               options: [
//                 "Dhaka", "Chittagong", "Sylhet", "Barisal"
//
//               ],
//               correctAnswer: 0
//           ),
//
//           QuestionModel(
//               questions: " What is the Currency of Bangladesh",
//               options: [
//                 "Dollar", "Taka", "Pound", "Rupies"
//
//               ],
//               correctAnswer: 1
//           ),
//
//
//         ]
//     ),
//
//     CategoryModel(
//         name: "Science",
//         icon: Icons.science,
//         questions: [
//           QuestionModel(
//               questions: " Which gas do plants absorb",
//               options: [
//                 "Oxygen", "Nitrogen", "Carbo - Dioxide", "Hydrogen"
//
//               ],
//               correctAnswer: 2
//           ),
//
//           // QuestionModel(
//           //     questions: " What is the Currency of Bangladesh",
//           //     options: [
//           //       "Dollar", "Taka", "Pound", "Rupies"
//           //
//           //     ],
//           //     correctAnswer: 2
//           // ),
//
//
//         ]
//     )
//
//
//
//
//   ];
//
//
//
//
//
//
//
// }
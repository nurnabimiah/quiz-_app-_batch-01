



import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';

class QuizResultScreen extends StatelessWidget {
   final CategoryModel category;
   QuizResultScreen({super.key,required this.category});

  @override
  Widget build(BuildContext context) {

    final quizProvider = context.watch<QuizProvider>();
    final score = quizProvider.calculateScore(category);

    return Scaffold(
     appBar:  AppBar(title: Text("Quiz result"),),


     body: Column(
       children: [
         const Text(
           "Your Score",
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
         ),

         SizedBox(height: 16,),

         Text(
           "$score / ${category.questions.length} ",
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
         ),


         ElevatedButton(onPressed: (){
           context.read<QuizProvider>().resetQuiz();
           context.go('/');

         }, child: Text("back to home")),



       ],
     ),


    );
  }
}

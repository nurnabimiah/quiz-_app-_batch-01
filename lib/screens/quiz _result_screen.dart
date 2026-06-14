import 'package:class_1/model/category_response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';

class QuizResultScreen extends StatelessWidget {
  final TriviaCategory category;
  
  const QuizResultScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final score = quizProvider.calculateScore();
    final total = quizProvider.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Your Score",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "$score / $total",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<QuizProvider>().resetQuiz();
                context.go('/');
              },
              child: const Text("Back to Home"),
            ),
          ),
        ],
      ),
    );
  }
}

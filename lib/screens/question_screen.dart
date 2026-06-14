import 'package:class_1/model/category_response_model.dart';
import 'package:class_1/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  final TriviaCategory category;

  const QuestionScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final questions = quizProvider.questions;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(category.name ?? ''),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length + 1,
        itemBuilder: (context, questionIndex) {
          // If we reached the end of the question list, show the Submit button
          if (questionIndex == questions.length) {
            return ElevatedButton(
              onPressed: () {
                context.push('/result', extra: category);
              },
              child: const Text("Submit Quiz"),
            );
          }

          final question = questions[questionIndex];
          final options = question.options ?? [];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${questionIndex + 1}',
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question.question ?? '',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: List.generate(options.length, (optionIndex) {
                      final isSelected = quizProvider.selectedOptions[questionIndex] == optionIndex;
                      return GestureDetector(
                        onTap: () {
                          context.read<QuizProvider>().selectOption(questionIndex, optionIndex);
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                            border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(
                              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                              color: isSelected ? Colors.blue : Colors.grey,
                            ),
                            title: Text(options[optionIndex]),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

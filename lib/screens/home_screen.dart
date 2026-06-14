import 'package:class_1/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widget/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch categories if the list is currently empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuizProvider>();
      if (provider.categories.isEmpty) {
        provider.fetchCategories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Quizi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push("/add-quiz");
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer<QuizProvider>(
                  builder: (context, quizProvider, child) {
                    final categories = quizProvider.categories;

                    // 1. Loading State
                    if (quizProvider.isLoading && categories.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // 2. Error State
                    if (quizProvider.errorMessage != null && categories.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quizProvider.errorMessage!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => quizProvider.fetchCategories(),
                              child: const Text("Retry"),
                            )
                          ],
                        ),
                      );
                    }

                    // 3. Empty State
                    if (categories.isEmpty) {
                      return const Center(
                        child: Text("No categories found."),
                      );
                    }

                    // 4. Data State (Using TriviaCategory from CategoryResponseModel)
                    return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          title: category.name ?? '',
                          subTitle: "Trivia Category ID: ${category.id ?? 0}",
                          iconData:  Icons.book,
                          onTap: () async {
                            // Reset previous answers
                            quizProvider.resetQuiz();

                            // Show standard loading dialog
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                            // Fetch questions from API
                            final success = await quizProvider.fetchQuestionsForCategory(category);

                            // Close loading dialog
                            if (context.mounted) {
                              Navigator.pop(context);
                            }

                            // Handle result
                            if (!success) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      quizProvider.errorMessage ?? 'Failed to load questions.',
                                    ),
                                  ),
                                );
                              }
                            } else {
                              if (context.mounted) {
                                // Navigate passing the raw TriviaCategory
                                context.push("/question", extra: category);
                              }
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

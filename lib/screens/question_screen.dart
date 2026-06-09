



import 'package:class_1/provider/quiz_provider.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  final CategoryModel category;

  const QuestionScreen({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    
    final quizProvider = context.watch<QuizProvider>();
    
    
    
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(category.name),
        leading: IconButton(onPressed: (){
          context.pop();
          // Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: category.questions.length + 1,
          itemBuilder: (context, questionIndex) {
            if (questionIndex == category.questions.length) {
              return ElevatedButton(
                onPressed: () {
                  context.push('/result', extra: category);
                },
                child: Text("Submit Quiz"),
              );
            }

            final question = category.questions[questionIndex];

            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Question ${questionIndex+1}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text(question.questions),
                    SizedBox(height: 8,),

                    Column(
                      children: List.generate(question.options.length, (optionIndex) {
                        final isSelected = quizProvider.selectedOptions[questionIndex] == optionIndex;
                        return GestureDetector(
                          onTap: () {
                            context.read<QuizProvider>().selectOption(questionIndex, optionIndex);
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                                border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12)
                            ),

                            child: ListTile(
                              leading: Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: isSelected ? Colors.blue : Colors.grey,),
                              title: Text(question.options[optionIndex]),
                            ),


                          ),
                        );



                      }),

                    ),



                  ],
                ),
              ),


            );

          }
      ),





      
    );
  }
}

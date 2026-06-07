


import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuestionScreen extends StatelessWidget {
  final CategoryModel category;

  const QuestionScreen({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
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
          itemCount: category.questions.length,
          itemBuilder: (context, index){

            final question = category.questions[index];

            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Question ${index+1}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text(question.questions),
                    SizedBox(height: 8,),

                    Column(
                      children: List.generate(question.options.length,(index){
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 10),
                          
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12)
                            
                            
                          ),
                          
                          child: ListTile(
                            leading: Icon(Icons.radio_button_off),
                            title: Text(question.options[index]),
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

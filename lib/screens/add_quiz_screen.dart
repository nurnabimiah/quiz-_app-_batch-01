


import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';

class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({super.key});

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {

  final questionController = TextEditingController();
  final option1Controller = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final option4Controller = TextEditingController();



  final List<QuestionModel> questions = [];

  String selectedCategory = "Science";
  int correctAnswer = 0;

  // void saveQuestion(){
  //
  //   for( var category in categories){
  //     if(category.name == selectedCategory){
  //       category.questions.add(
  //         QuestionModel(
  //             questions: questionController.text,
  //             options: [
  //               option1Controller.text,
  //               option2Controller.text,
  //               option3Controller.text,
  //               option4Controller.text,
  //             ],
  //             correctAnswer: correctAnswer
  //         )
  //
  //       );
  //
  //       break;
  //
  //     }
  //   }
  //
  //   Navigator.pop(context);
  //
  //
  //
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Add Quiz',style: TextStyle(color: Colors.white),),

        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 50),
        child: SingleChildScrollView(
          child: Column(
          
            children: [

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //       labelText: "Select Category",
              //       border: OutlineInputBorder(
              //
              //       )
              //     ),
              //     items: categories.map((cateory){
              //       return DropdownMenuItem(
              //           value: cateory.name,
              //           child: Text(cateory.name)
              //       );
              //
              //     }).toList() ,
              //     onChanged: (value){
              //       setState(() {
              //         selectedCategory = value!;
              //         print("========================== selected category: ${selectedCategory}");
              //
              //       });
              //
              //     }
              // ),
          
          
          
          
               SizedBox(height: 25,),
          
              // Questions
              CustomTextformFiled(
                questionController: questionController,
                labelText: 'Question',),
          
              SizedBox(height: 10,),
          
          
              // options - 01
              CustomTextformFiled(
                  questionController: option1Controller,
                  labelText: "Option 1",
              ),
              SizedBox(height: 10,),
          
              //Option - 02
              CustomTextformFiled(
                questionController: option2Controller,
                labelText: 'Options 2',),
          
              SizedBox(height: 10,),
          
          
              // options - 03
              CustomTextformFiled(
                questionController: option3Controller,
                labelText: "Option 3",
              ),
              SizedBox(height: 10,),
          
          
              // options - 4
              CustomTextformFiled(
                questionController: option4Controller,
                labelText: "Option 4",
              ),
              SizedBox(height: 20,),
          
          
              // correct ans
              DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                      labelText: "Correct Answer",
                      border: OutlineInputBorder(
          
                      )
                  ),
                  items: [
          
                    DropdownMenuItem(
                        value: 0,
                        child: Text("Option 1")
                    ),
                    DropdownMenuItem(
                        value: 1,
                        child: Text("Option 2")
                    ),
                    DropdownMenuItem(
                        value: 2,
                        child: Text("Option 3")
                    ),
                    DropdownMenuItem(
                        value: 3,
                        child: Text("Option 4")
                    ),
          
          
                  ],
                  onChanged: (value){
                    setState(() {
                      correctAnswer = value!;
                      print("========================== selected category: ${correctAnswer}");
          
                    });
          
                  }
              ),
              SizedBox(height: 20,),
          
          
              // Button
          
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    onPressed: (){
                      // saveQuestion();
          
                    },
                    child: Text("Save Quiz")
                ),
              )
          
          
          
          
          
          
          
          
          
            ],
          
          ),
        ),
      ),






    );
  }
}

class CustomTextformFiled extends StatelessWidget {

  final TextEditingController questionController;
  final String labelText;

  const CustomTextformFiled({
    super.key,
    required this.questionController,
    required this.labelText
  });



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: questionController,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder()
      ),

    );
  }
}

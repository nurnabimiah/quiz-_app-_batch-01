
import 'package:class_1/screens/question_screen.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';

import '../widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Quizi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),

              SizedBox(height: 16,),

              Expanded(
                child: ListView.builder(
                    itemCount: AppData.categories.length,
                    itemBuilder: (context,index){
                      final category = AppData.categories[index];

                      return CategoryCard(
                          title: category.name,
                          subTitle: "${category.questions.length} Question",
                          iconData: category.icon,
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (_) => QuestionScreen(category: category,))
                            );

                          },

                      );
                    }
                ),
              )


            ],

          )
        )
      ),



    );
  }
}






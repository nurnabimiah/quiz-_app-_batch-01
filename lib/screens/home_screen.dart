
import 'package:class_1/provider/quiz_provider.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Quizi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push("/add-quiz");
          // Navigator.pushNamed(context, "add-quiz");

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

              Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),

              SizedBox(height: 16,),

              Expanded(
                child: Consumer<QuizProvider>(
                  builder: (context, quizProvider, child) {
                    final categories = quizProvider.categories;

                    return ListView.builder(
                        itemCount:categories.length,
                        itemBuilder: (context,index){
                          final category = categories[index];
                          return CategoryCard(
                              title: category.name,
                              subTitle: "${category.questions.length} Question",
                              iconData: category.icon,
                              onTap: () {
                                context.push("/question",extra: category);
                                // Navigator.push(context,MaterialPageRoute(builder: (_) => QuestionScreen(category: category,))


                              },

                          );
                        }
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






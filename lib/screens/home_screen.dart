
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final provider = context.read<QuizProvider>();

      if(provider.categories.isEmpty){
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

                    if(quizProvider.isLoading && categories.isEmpty){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    }

                    // 2. error state

                    if(quizProvider.errorMessage !=null  && categories.isEmpty){
                      return  Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(quizProvider.errorMessage!,textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(height: 15,),
                            ElevatedButton(onPressed: ()=> quizProvider.fetchCategories(),
                                child: Text("Retry")
                            )

                          ],
                        )
                      );

                    }


                    // 3.Empty state
                    if(categories.isEmpty){
                      return Center(child: Text("No categories found"),);
                    }



                   // Date state (using Triviacategory from CategoryResponsemodel)
                    return ListView.builder(

                        itemCount:categories.length,
                        itemBuilder: (context,index){
                          final category = categories[index];
                          return CategoryCard(
                              title: category.name ?? '',
                              subTitle: " Trivia Category Id : ${category.id}",
                              iconData: Icons.book,
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






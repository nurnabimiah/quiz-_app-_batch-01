
import 'package:class_1/screens/add_quiz_screen.dart';
import 'package:class_1/screens/question_screen.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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

              GestureDetector(
                onTap: (){
                  context.push("/add-quiz");

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset("assets/images/apple_logo.png"),
                        SizedBox(width: 20,),
                       Text("Apple Login")

                     ],
                   ),
                  )
                ),
              ),
              SizedBox(height: 16,),


              GestureDetector(
                onTap: (){
                  context.push("/add-quiz");

                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google.svg"),
                          SizedBox(width: 20,),
                          Text(" Google Login")

                        ],
                      ),
                    )
                ),
              ),
              SizedBox(height: 16,),
              
              // network image.............
              
              Image.network("https://assets.korearisk.com/uploads/2026/02/north-korea-ninth-party-congress-ends-day-7-kju-kim-jong-un-pyongyang-rodong-sinmun-feb-26-2026-photos-2.jpg",
              height: 200,

              ),
              
              
              

              SizedBox(height: 16,),

              Expanded(
                child: ListView.builder(
                    itemCount: categories.length,
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
                ),
              )


            ],

          )
        )
      ),



    );
  }
}






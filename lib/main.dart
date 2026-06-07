

import 'package:class_1/screens/add_quiz_screen.dart';
import 'package:class_1/screens/home_screen.dart';
import 'package:class_1/screens/navigation_screen.dart';
import 'package:class_1/screens/question_screen.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(const YourApp());
}


class YourApp extends StatelessWidget{
  const YourApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,


      // onGenerateRoute: (setting){
      //   switch (setting.name){
      //     case  "/home":
      //       return MaterialPageRoute(
      //           builder: (_) => HomeScreen()
      //       );
      //
      //       case "add-quiz":
      //         return MaterialPageRoute(
      //             builder: (_) => AddQuizScreen());
      //
      //     case "question":
      //       final category = setting.arguments as CategoryModel;
      //       return MaterialPageRoute(
      //           builder: (_) => QuestionScreen(category: category));
      //
      //
      //       default:
      //         return MaterialPageRoute(builder: (_)=> Scaffold(body: Center(child: Text("Route not found"),),));
      //
      //
      //
      //
      //
      //   }
      //
      //
      // },

    );
  }
  
  
}



 final GoRouter appRouter = GoRouter(
     routes: [
       GoRoute(
           path: '/',
           builder: (context,state) => NavigationScreen()
       ),


       GoRoute(
           path: '/question',
           builder: (context,state) {
             final category = state.extra as CategoryModel;
             return QuestionScreen(category: category);
           }
       ),

       GoRoute(
           path: '/add-quiz',
           builder: (context,state) => AddQuizScreen()
       ),


     ]
 );



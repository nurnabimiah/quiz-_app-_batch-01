
import 'package:class_1/provider/counter_provider.dart';
import 'package:class_1/provider/navigation_provider.dart';
import 'package:class_1/provider/quiz_provider.dart';
import 'package:class_1/screens/add_quiz_screen.dart';
import 'package:class_1/screens/navigation_screen.dart';
import 'package:class_1/screens/question_screen.dart';
import 'package:class_1/screens/quiz%20_result_screen.dart';
import 'package:class_1/utils/category_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()),
      ],
      child: const YourApp()));
}


class YourApp extends StatelessWidget{

  const YourApp ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

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

       GoRoute(
           path: '/result',
           builder: (context,state) {
             final category = state.extra as CategoryModel;
             return QuizResultScreen(category: category);
           }
       ),


     ]
 );



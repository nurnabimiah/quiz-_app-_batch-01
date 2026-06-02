import 'package:class_1/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}


class YourApp extends StatelessWidget{
  const YourApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationScreen(),

    );
  }
  
  
}








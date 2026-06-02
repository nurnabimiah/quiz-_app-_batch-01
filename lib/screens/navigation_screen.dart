

import 'package:class_1/screens/activity_screen.dart';
import 'package:class_1/screens/home_screen.dart';
import 'package:class_1/screens/profile_screen.dart';
import 'package:class_1/screens/search_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int currentIndex = 0;

  final List <Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    ActivityScreen(),
    ProfileScreen()

  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: pages[currentIndex],



     bottomNavigationBar: BottomNavigationBar(

         selectedItemColor: Colors.blue,
         unselectedItemColor: Colors.grey,
         type:  BottomNavigationBarType.fixed,

         currentIndex: currentIndex ,


         onTap: (index){
           setState(() {
             currentIndex = index;

           });
         },

         items: [
           
           BottomNavigationBarItem(
               icon: Icon(Icons.home_outlined),
               activeIcon: Icon(Icons.home),
               label: "Home"

           ),



           BottomNavigationBarItem(
               icon: Icon(Icons.search),
               activeIcon: Icon(Icons.search),
               label: "Search"

           ),



           BottomNavigationBarItem(
               icon: Icon(Icons.favorite_border),
               activeIcon: Icon(Icons.favorite),
               label: "Activity"

           ),



           BottomNavigationBarItem(
               icon: Icon(Icons.person_outline),
               activeIcon: Icon(Icons.person),
               label: "Profile"

           )
           
           
           
         ]

     ),





    );
  }
}

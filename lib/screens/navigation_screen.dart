

import 'package:class_1/screens/activity_screen.dart';
import 'package:class_1/screens/home_screen.dart';
import 'package:class_1/screens/profile_screen.dart';
import 'package:class_1/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/navigation_provider.dart';

class NavigationScreen extends StatelessWidget {
   NavigationScreen({super.key});

  final List <Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    ActivityScreen(),
    ProfileScreen()

  ];

  @override
  Widget build(BuildContext context) {

    final navProvider = context.watch<NavigationProvider>();


    return Scaffold(

      body: pages[navProvider.currentIndex],

     bottomNavigationBar: BottomNavigationBar(

         selectedItemColor: Colors.blue,
         unselectedItemColor: Colors.grey,
         type:  BottomNavigationBarType.fixed,

         currentIndex: navProvider.currentIndex,

         onTap: (index){
           context.read<NavigationProvider>().setIndex(index);
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

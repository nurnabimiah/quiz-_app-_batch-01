

import 'package:class_1/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
            
                SizedBox( height:30,),
            
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage("https://cdn.britannica.com/05/236505-050-17B6E34A/Elon-Musk-2022.jpg"),
            
                  ),
                ),
                SizedBox(height: 10,),
            
                Text("Elon Mask",style: TextStyle(fontSize: 24) ,),
                Text("Flutter Developer",style: TextStyle(fontSize: 16,color: Colors.blue),),
            
                SizedBox(height: 18,),
            
                Padding(
                  padding:  EdgeInsets.only(left: 10, right: 10),
                  child: Text("Passonite flutter developer who loves building beautiful mobile apps and new technologies",style: TextStyle(fontSize: 14,),
                    textAlign:TextAlign.center ,),
                ),
            
                SizedBox(height: 30,),
            
            
            
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
            
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
            
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(" 120",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.white),),
                            Text(" Post",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
            
                        Container(
                          height: 140,
                          width: 1,
                          color: Colors.white,
            
                        ),
            
            
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(" 120",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.white),),
                            Text(" Post",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
            
            
            
                        Container(
                          height: 140,
                          width: 1,
                          color: Colors.white,
            
                        ),
            
            
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(" 120",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.white),),
                            Text(" Post",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
            
            
                      ],
                    ),
                  ),
            
            
                ),
                SizedBox(height: 30,),
                const SizedBox(height: 15),


                Consumer<ThemeProvider>(
                  builder: (context,themeProvider,child) {
                    return Container(
                      padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade400)
                      ),
                      child: Row(

                        children: [
                          Icon(themeProvider.isDark ?Icons.dark_mode:Icons.light_mode),
                          SizedBox(width: 10,),

                          Text(themeProvider.isDark?"Dark mode":"Light Mode",style: TextStyle(fontWeight: FontWeight.w600),),

                          SizedBox(width: 10,),

                          Switch(
                              value: themeProvider.isDark,
                              onChanged:themeProvider.toggleTheme
                          )


                        ],

                      ),


                    );
                  }
                )



            
            
            
            
            
            
            
            
            
            
            
            
              ],
            
            
            
            ),
          ),
        ),
      ),



    );
  }
}




import 'package:class_1/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Counter App"),),


      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CounterProvider>().increment();

      },child: Icon(Icons.add),),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text("This is the counter: ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),),

            // Result
            Consumer<CounterProvider>(
              builder: (context,counterProvider,child) {
                return Text("${counterProvider.count}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),);
              }
            ),


          ],
        ),
      ),



    );
  }
}




import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
   final String title;
   final dynamic subTitle;
   final IconData iconData;
   final VoidCallback onTap;

  const CategoryCard({super.key,required this.title,required this.subTitle,required this.iconData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          child: Icon(iconData),

        ),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Icon(Icons.arrow_forward_ios),

      ),


    );
  }
}

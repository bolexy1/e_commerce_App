import 'package:flutter/material.dart';

class Smalltext extends StatelessWidget {
   final String text;
   Color? color;
  double size;
  double height;
  
   Smalltext({super.key, this.size= 12, this.height=1.2, required this.text,  this.color = const Color(0xFFccc7c5), required,   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,      
      style: TextStyle(
        color: color,        
        // fontFamily: 'Roboto',
        fontSize: size,
        height: height
        ),
    );
  }
}
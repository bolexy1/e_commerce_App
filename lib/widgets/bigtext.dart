import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
   Color? color;
  double size;
  TextOverflow overflow;
   BigText({super.key, this.size= 20, this.overflow = TextOverflow.ellipsis, required this.text,  this.color = const Color(0xFF332d2b)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: Size==20?AppLayout.getHeight(20):size,
        ),
      
    );
  }
}
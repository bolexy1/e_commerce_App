import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  
  final Color iconColor;
   const IconAndText({super.key, 
   required this.icon, 
   required this.text, 
    
   required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size:AppLayout.getHeight(24)),
        SizedBox(width: AppLayout.getWidth(1),),
        Smalltext(text: text,  ),
      ],
    );
  }
}
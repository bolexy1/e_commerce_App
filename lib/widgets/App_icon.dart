import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColor;
  final double size;

   AppIcon({super.key, required this.icon,  this.backgroundcolor = const Color(0xFFfcf4e4),  this.iconColor = const Color(0xFF756d54),  this.size=40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolor,
      ),
      child: Icon(icon, color: iconColor, size:AppLayout.getHeight(16),),
    );
  }
}
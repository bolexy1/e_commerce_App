import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;  
  final String hintText;
  final IconData icon;
  const AppTextField({super.key, required this.hintText, required this.icon, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: Offset(1,10),
                  color: Colors.grey.withOpacity(0.2)

                ),
                
              ],
              borderRadius: BorderRadius.circular(AppLayout.getHeight(30))
              
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                // hintText,
                hintText: hintText,
                // prefixIcon
                prefixIcon: Icon(icon, color: AppColors.yellowColor,), 
                // focusedBorder
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )

                ),
                // enabledBoarder
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )

                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
                 

                ),
              ),

            ),
          );
  }
}
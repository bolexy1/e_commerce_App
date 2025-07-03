import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:e_commerce_app/widgets/Icon_and_text.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';

class AppColunm extends StatelessWidget {
  final String text;
  const AppColunm({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: text, size: AppLayout.getHeight(26),),
                  SizedBox(height: AppLayout.getHeight(10),),
                  Row(
                    children: [
                      Wrap(
                        children: 
                          List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,)),                     
                      ),
                      SizedBox(width: 10,),
      
                      Smalltext(text: "4.5"),
                      SizedBox(width: 10,),
                      Smalltext(text: "1287"),
                      SizedBox(width: 10,),
                      Smalltext(text: "Comments")
                    ],
                  ),
      
                  SizedBox(height: AppLayout.getHeight(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(icon: Icons.circle_sharp, text: "Normal",  iconColor: AppColors.inconColor1), 
                      SizedBox(width: 0,),
                      IconAndText(icon: Icons.location_on, text: "1,7km",  iconColor: AppColors.mainColor),
                      SizedBox(width: 0,),
                      IconAndText(icon: Icons.access_time_rounded, text: "32mins",  iconColor: AppColors.iconColor2),                   
      
                    ],),
      
      
              ],);
  }
}
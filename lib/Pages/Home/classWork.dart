import 'package:e_commerce_app/Pages/Home/dark_mode.dart';
import 'package:e_commerce_app/Pages/Home/food_page_body.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';

class Classwork extends StatefulWidget {
  const Classwork ({super.key});

  @override
  State<Classwork > createState() => _ClassworkState();
}

class _ClassworkState extends State<Classwork > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 65, 65),
      body: Column(
        children: [
          //showing the header
          Container(
            
            child: Container(
              margin: EdgeInsets.only(top: AppLayout.getHeight(45),bottom: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(left: AppLayout.getWidth(20),right: AppLayout.getWidth(20)),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                     BigText(text:"Nigeria", color: Colors.white,),
                      Row(
                        children: [
                          Smalltext(text: "Ibadan", color: Colors.white,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
          
                    ],
                  ),
                  Center(
                    child: Container(
                      width: AppLayout.getHeight(45),
                      height: AppLayout.getHeight(45),
                      child: Icon(Icons.search, color: Colors.white,size: AppLayout.getHeight(24),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                        color: AppColors.mainColor,
                              
                      ),
                    ),
                  )
                ],
              )),
          ),
         // showing the body
          Expanded(child: SingleChildScrollView(
            
            child: DarkMode(),
          ))
        ],
      ),
    );
  }
}
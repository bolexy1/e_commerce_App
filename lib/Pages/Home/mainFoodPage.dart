import 'package:e_commerce_app/Pages/Home/food_page_body.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';

class Mainfoodpage extends StatefulWidget {
  const Mainfoodpage({super.key});

  @override
  State<Mainfoodpage> createState() => _MainfoodpageState();
}

class _MainfoodpageState extends State<Mainfoodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                     BigText(text:"Nigeria", color: AppColors.mainColor,),
                      Row(
                        children: [
                          Smalltext(text: "Ibadan", color: Colors.black54,),
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
            
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
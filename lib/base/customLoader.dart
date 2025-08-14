import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class Customloader extends StatelessWidget {
  const Customloader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppLayout.getHeight(100),
        width: AppLayout.getHeight(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(50)
          ),
          color: AppColors.mainBlackColor
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color:  Colors.white,),
      ),
    );
  }
}
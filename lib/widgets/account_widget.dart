import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
   AccountWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppLayout.getWidth(20),
      top: AppLayout.getHeight(10),
      bottom: AppLayout.getHeight(10)),

      child: Row(
        children: [
          appIcon,
          SizedBox(width: AppLayout.getWidth(20),),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
    );
  }
}
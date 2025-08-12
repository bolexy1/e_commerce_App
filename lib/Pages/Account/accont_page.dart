import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/account_widget.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:flutter/material.dart';

class AccontPage extends StatelessWidget {
  const AccontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        title: Center(child: BigText(text: "Profile", size: 24, color: Colors.white,)),
         backgroundColor: AppColors.mainColor,
      ),
       body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: AppLayout.getHeight(10)),
         child: Column(
          children: [
            // profile icon
             AppIcon(icon: Icons.person, backgroundcolor: AppColors.mainColor, iconColor: Colors.white,iconSize: AppLayout.getHeight(75), size: AppLayout.getHeight(150),),

             SizedBox(height: AppLayout.getHeight(30),),
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                  children: [ // name
                 AccountWidget(appIcon: AppIcon(icon: Icons.person,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.mainColor, iconColor: Colors.white,), 
                 bigText: BigText(text: "Promsie")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  //  phone
                   AccountWidget(appIcon: AppIcon(icon: Icons.phone,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text: "07062046749")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // email
                   AccountWidget(appIcon: AppIcon(icon: Icons.email,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text: "Bolexy1@gmail.com")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // address
                   AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text: "Raolak hub, Iyana church")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // messages
                   AccountWidget(appIcon: AppIcon(icon: Icons.message_outlined,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: Colors.redAccent, iconColor: Colors.white,), 
                 bigText: BigText(text: "Promsie")),
                  SizedBox(height: AppLayout.getHeight(20),),
                   AccountWidget(appIcon: AppIcon(icon: Icons.message_outlined,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: Colors.redAccent, iconColor: Colors.white,), 
                 bigText: BigText(text: "Promsie")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  ],
                 ),
               ),
             )
           
          ],
         ),
       ),

    );
  }
}
import 'package:e_commerce_app/base/customLoader.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/user_Controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/account_widget.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccontPage extends StatelessWidget {
  const AccontPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().UserLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar( 
        title: Center(child: BigText(text: "Profile", size: 24, color: Colors.white,)),
         backgroundColor: AppColors.mainColor,
      ),
       body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?(userController.isLoading?Container(
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
                 bigText: BigText(text: userController.userModel.name)),
                  SizedBox(height: AppLayout.getHeight(20),),
                  //  phone
                   AccountWidget(appIcon: AppIcon(icon: Icons.phone,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text:userController.userModel.phone)),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // email
                   AccountWidget(appIcon: AppIcon(icon: Icons.email,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text: userController.userModel.email)),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // address
                   AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: AppColors.yellowColor, iconColor: Colors.white,), 
                 bigText: BigText(text: "Raolak hub, Iyana church")),
                  SizedBox(height: AppLayout.getHeight(20),),
                  // messages
                   AccountWidget(appIcon: AppIcon(icon: Icons.message_outlined,
                 iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: Colors.redAccent, iconColor: Colors.white,), 
                 bigText: BigText(text: "Messages")),
                  SizedBox(height: AppLayout.getHeight(20),),
                   GestureDetector(
                    onTap: () {
                      if(Get.find<AuthController>().UserLoggedIn()){
                        Get.find<AuthController>().clearShareData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSigninPage());

                      }                      
                    },
                     child: AccountWidget(appIcon: AppIcon(icon: Icons.logout,
                                      iconSize: AppLayout.getHeight(25), size: AppLayout.getHeight(50),backgroundcolor: Colors.redAccent, iconColor: Colors.white,), 
                                      bigText: BigText(text: "Logout")),
                   ),
                  SizedBox(height: AppLayout.getHeight(20),),
                  ],
                 ),
               ),
             )
           
          ],
         ),
       ):Customloader()):
       Container(
        child: 
        Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            width: double.maxFinite,
            height: AppLayout.getHeight(160),
            margin: EdgeInsets.only(left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/signintocontinue.png"))
            ),
                   ),
                   GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSigninPage());
                    },
                     child: Container(
                                 width: double.maxFinite,
                                 height: AppLayout.getHeight(100),
                                 margin: EdgeInsets.only(left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
                                 decoration: BoxDecoration(
                                   color: AppColors.mainColor,
                                   borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                                  
                                 ),
                                 child: Center(child: BigText(text: "Sign In", color: Colors.white,size: AppLayout.getHeight(26),)),
                     ),
                   ),

          ],
        )
        ),);

       })
    );
  }
}
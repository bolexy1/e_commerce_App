import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/app_text_field.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
   SignInPage({super.key});
   var emailController =TextEditingController();
    var passwordController =TextEditingController();
    var nameController =TextEditingController();
    var phoneController =TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png"


    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppLayout.screenHeight*0.05,),
            Container(
              height: AppLayout.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/logo part 1.png"),
                ),
              ),
            ),
            AppTextField(
              hintText: "Email", 
              icon: Icons.email, 
              textController: emailController),
              SizedBox(height: AppLayout.getHeight(20),),
                          
            AppTextField(
              hintText: "Password", 
              icon: Icons.password_sharp, 
              textController: passwordController),
              SizedBox(height: AppLayout.getHeight(20),),
               AppTextField(
              hintText: "Name", 
              icon: Icons.person, 
              textController: nameController),
              SizedBox(height: AppLayout.getHeight(20),),         
                     
            AppTextField(
              hintText: "Phone", 
              icon: Icons.mobile_off_rounded, 
              textController: phoneController),
              SizedBox(height: AppLayout.getHeight(20),),
              // Sign up botton
        
              Container(
                width: AppLayout.screenWidth/2,
                height: AppLayout.screenHeight/13,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(30))
        
                ),
                child: Center(
                  child: BigText(text: "Sing up",
                  size: AppLayout.getHeight(30),color: Colors.white,),
                ),
              ),
              SizedBox(height: AppLayout.getHeight(10),),
              // tag line
              RichText(
                text: TextSpan(
                  recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: AppLayout.getHeight(20)
                  )
                  )
                  ),
                  SizedBox(height: AppLayout.screenHeight*0.05,),
                  // sign up options
                  RichText(
                text: TextSpan(
                  // recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: AppLayout.getHeight(16)
                  )
                  )
                  ),
                  Wrap(
                    children: List.generate(3, (index)=>Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: AppLayout.getHeight(30),
                        backgroundImage: AssetImage(
                          "assets/images/"+signUpImages[index]
                        ),
                      ),
                    )),
                  )
                          
            
                          
           
          ],
        ),
      ),
    );
 ;
  }
}
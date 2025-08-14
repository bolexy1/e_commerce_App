import 'package:e_commerce_app/Pages/auth/sign_up_page.dart';
import 'package:e_commerce_app/base/customLoader.dart';
import 'package:e_commerce_app/base/show_custom_snackbar.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
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
    

  @override
  Widget build(BuildContext context) {
     void _login(AuthController authController) {
      
      
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Type in your email", title: "Email address");

      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");

      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "password");

      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six Characters", title: "Password six");

      }else{
        showCustomSnackBar("We are in", title: "Perfect");
        
           authController.login(email, password).then((status){
            if(status.isSuccess){
              Get.toNamed(RouteHelper.getInitial());

            }else{
              showCustomSnackBar(status.message); 
            }
           });

           

      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading? SingleChildScrollView(
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

            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: AppLayout.getWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(fontSize: AppLayout.getHeight(70),
                  fontWeight: FontWeight.bold),),
                   Text("Sign into your Account",style: TextStyle(
                    fontSize: AppLayout.getHeight(20),color: Colors.grey[500]
                  ),)
                ],
              ),
            ),
            SizedBox(height: AppLayout.getHeight(20),),
            AppTextField(
              hintText: "Email", 
              icon: Icons.email, 
              textController: emailController),
              SizedBox(height: AppLayout.getHeight(20),),
                          
            AppTextField(
              isObscure: true,
              hintText: "Password", 
              icon: Icons.password_sharp, 
              textController: passwordController),
               SizedBox(height: AppLayout.getHeight(20),),
               Row(
                
                 children: [
                  Expanded(child: Container()),
                   RichText(
                    text: TextSpan(
                      recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
                      text: "Sign into your account",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: AppLayout.getHeight(20)
                      )
                      )
                      ),
                      SizedBox(width: AppLayout.getWidth(20),)
                 ],
               ),
              SizedBox(height: AppLayout.screenHeight*0.05,),
        
              GestureDetector(
                onTap: () {
                  _login(authController);
                },
                child: Container(
                  width: AppLayout.screenWidth/2,
                  height: AppLayout.screenHeight/13,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(30))
                        
                  ),
                  child: Center(
                    child: BigText(text: "Sign in",
                    size: AppLayout.getHeight(30),color: Colors.white,),
                  ),
                ),
              ),
              
              // tag line
             
                  SizedBox(height: AppLayout.screenHeight*0.05,),
                  // sign up options
                  RichText(
                text: TextSpan(
                  // recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Don\'t have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: AppLayout.getHeight(20)
                  ),
                  children: [
                     TextSpan(
                   recognizer:TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                  text: " Create",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainBlackColor,
                    fontSize: AppLayout.getHeight(20)
                  ),
                  
                     )
                    
                  ]
                  )
                  ),
                 
                          
            
                          
           
          ],
        ),
      ):Customloader();
      })
    );
 ;
  }
}
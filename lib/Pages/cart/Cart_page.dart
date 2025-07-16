import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: AppLayout.getHeight(60),
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
              backgroundcolor: AppColors.mainColor,
              iconSize: AppLayout.getHeight(24),),
              SizedBox( width:  AppLayout.getWidth(100)),
               GestureDetector(
                onTap: () {
                  Get.to(()=>Mainfoodpage());
                },
                 child: AppIcon(icon: Icons.home_outlined,
                               iconColor: Colors.white,
                               backgroundcolor: AppColors.mainColor,
                               iconSize: AppLayout.getHeight(24),),
               ),
               AppIcon(icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundcolor: AppColors.mainColor,
              iconSize: AppLayout.getHeight(24),)

            ],
          )),
          Positioned(
            top: AppLayout.getHeight(100),
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: AppLayout.getHeight(15)),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  return ListView.builder(
                  itemCount: cartController.getItems.length,
                  itemBuilder: (_, index){
                    return Container(
                      height: AppLayout.getHeight(100),
                      width: double.maxFinite,
                
                     child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: AppLayout.getHeight(10)),
                          width: AppLayout.getHeight(100),
                          height: AppLayout.getHeight(100),
                          decoration: BoxDecoration(
                            
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.BASE_URL+AppConstants.UPLOAD_URI+cartController.getItems[index].img!
                              )),
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                            
                
                          ),
                        ),
                        SizedBox( width: AppLayout.getWidth(10),),

                        Expanded(child: Container(
                          height: AppLayout.getHeight(100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                              Smalltext(text: "spicy"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(text: cartController.getItems[index]!.price.toString(), color: Colors.black54,),
                                   Container(            
               
               padding: EdgeInsets.only(top:AppLayout.getHeight(4), bottom: AppLayout.getHeight(10), left: AppLayout.getWidth(10),right: AppLayout.getWidth(10) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                color: Colors.white,
              ),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signcolor,)),
                  SizedBox(width: AppLayout.getWidth(5),),
                  BigText(text:' 0'),//popularProduct.inCartItems.toString()),
                  SizedBox(width: AppLayout.getWidth(5),),
                  GestureDetector(
                    onTap: () {                      
                      // popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signcolor,))
                ],
              ),
            ),

                                ],
                              )
                            
                            ]

                          ),
                        ))
                      ],
                     ),
                
                    );
                
                } );
                }),
              ),
            ))
        ],
      ),
    );
  }
}
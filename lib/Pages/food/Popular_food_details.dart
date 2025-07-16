import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/Expandable_text.dart';
import 'package:e_commerce_app/widgets/Icon_and_text.dart';
import 'package:e_commerce_app/widgets/app_colunm.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
   PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[pageId];
    // print('page is id'+pageId.toString());
    // print('product name is'+product.name.toString());

    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: AppLayout.getHeight(350),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URI+product.img!))
              ),
            )),
            //icon widget
            Positioned(
              top: AppLayout.getHeight(45),
              left:  AppLayout.getWidth(20),
              right: AppLayout.getWidth(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>Mainfoodpage());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
            //Introduction to food 
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: AppLayout.getHeight(330),
                child: Container(
                  padding: EdgeInsets.only(left: AppLayout.getWidth(20),right:AppLayout.getWidth(20), top: AppLayout.getHeight(20) ),
                  height: AppLayout.getHeight(480),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(20)), topRight: Radius.circular(AppLayout.getHeight(20)),),
                    color: Colors.white,
                  ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     AppColunm(text: product.name!),
                     SizedBox(height: AppLayout.getHeight(20),),
                     BigText(text: "Introduce"),
                     //expandable text widget
                     SizedBox(height:AppLayout.getHeight(20)),
                     Expanded(child: SingleChildScrollView(child: ExpandableText(text: product.description! )))
                   ],
                 ),


              )
              ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
        height: AppLayout.getHeight(120),
        padding: EdgeInsets.only(top: AppLayout.getHeight(25), bottom: AppLayout.getHeight(25),left: AppLayout.getWidth(20),right: AppLayout.getWidth(20)),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(40)),topRight: Radius.circular(AppLayout.getHeight(40)),)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //  height: 70,
              //  width: 110,
               padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                color: Colors.white,
              ),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signcolor,)),
                  SizedBox(width: AppLayout.getWidth(20),),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(width: AppLayout.getWidth(20),),
                  GestureDetector(
                    onTap: () {                      
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signcolor,))
                ],
              ),
            ),

            Container(
              // height: AppLayout.getHeight(70),
              // width: AppLayout.getWidth(150),
              padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                color: AppColors.mainColor,
              ),
              child: Center(child: GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: BigText(text: "\$ ${product.price!} | Add to cart",size: AppLayout.getHeight(18), color: Colors.white,))),
            )
          ],
        ),
      );
        
      }, 
),
    );
  }
}
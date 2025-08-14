import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/base/No_data_page.dart';
import 'package:e_commerce_app/controllers/Recommended_products_controller.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
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
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcon(icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundcolor: AppColors.mainColor,
                iconSize: AppLayout.getHeight(24),),
              ),
              SizedBox( width:  AppLayout.getWidth(100)),
               GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
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
           GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0?Positioned(
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
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: (_, index){
                    return Container(
                      height: AppLayout.getHeight(100),
                      width: double.maxFinite,
                
                     child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                             var popularIndex = Get.find<PopularProductController>()
                             .popularProductList.indexOf(_cartList[index].product!);
                             if (popularIndex>=0){
                              Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));

                             }else{
                               var recommendedIndex= Get.find<RecommendedProductController>()
                             .recommendedProductList.indexOf(_cartList[index].product!);
                             if(recommendedIndex<0){
                              Get.snackbar('History', " Product review is not available for history products!",
                              backgroundColor: AppColors.mainColor,colorText: Colors.white );

                             }else{
                              Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                             }
                             }
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: AppLayout.getHeight(10)),
                            width: AppLayout.getHeight(100),
                            height: AppLayout.getHeight(100),
                            decoration: BoxDecoration(
                              
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  cartController.getItems[index].img!
                                )),
                              borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                              
                                          
                            ),
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
                      cartController.addItem(_cartList[index].product!, -1);
                      // popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signcolor,)),
                  SizedBox(width: AppLayout.getWidth(5),),
                  BigText(text:_cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                  SizedBox(width: AppLayout.getWidth(5),),
                  GestureDetector(
                    onTap: () {  
                      cartController.addItem(_cartList[index].product!, 1);                    
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
            )):NoDataPage(text: "Your cart is empty!");
           })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
        height: AppLayout.getHeight(120),
        padding: EdgeInsets.only(top: AppLayout.getHeight(25), bottom: AppLayout.getHeight(25),left: AppLayout.getWidth(20),right: AppLayout.getWidth(20)),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(40)),topRight: Radius.circular(AppLayout.getHeight(40)),)
        ),
        child: cartController.getItems.length>0? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(            
               
               padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                color: Colors.white,
              ),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  SizedBox(width: AppLayout.getWidth(10),),
                  BigText(text: "\$ "+cartController.totalAmount.toString()),
                  SizedBox(width: AppLayout.getWidth(10),),
                  
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                if(Get.find<AuthController>().UserLoggedIn())  {
                  cartController.addToHistory();
                }else{
                  Get.toNamed(RouteHelper.getSigninPage());
                }              
                // popularProduct.addItem(product);
                
              },
              child: Container(
                // height: AppLayout.getHeight(70),
                // width: AppLayout.getWidth(150),
                padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(text: "check out",size: AppLayout.getHeight(18), color: Colors.white,)),
              ),
            )
          ],
        ):Container(),
      );
        
      }, 
),
    );
  }
}
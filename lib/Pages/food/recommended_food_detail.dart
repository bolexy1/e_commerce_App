import 'package:e_commerce_app/Pages/cart/Cart_page.dart';
import 'package:e_commerce_app/controllers/Recommended_products_controller.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/Expandable_text.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
 final int pageId;
   RecommendedFoodDetail({super.key, required this.pageId});

  

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(builder: (controller){
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>CartPage());
                          },
                          child: AppIcon(icon: Icons.shopping_cart_outlined)),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent, backgroundcolor: AppColors.mainColor,)):
                        Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right: 7,
                          top: 1,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(), size:12, color: Colors.white,)):
                        Container()


                      ],
                    );
                  })
              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(20), 
            child: Container(
              width: double.maxFinite,
              
              
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Center(child: BigText(text: product.name!, size: AppLayout.getHeight(26),)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(20)),topRight: Radius.circular(AppLayout.getHeight(20))),
                color: Colors.white,
              ),
      
            )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                  child:ExpandableText(text: product.description!),
                )
              ],
            ) ,
            )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: AppLayout.getWidth(50), right: AppLayout.getWidth(50),top: AppLayout.getHeight(10), bottom:AppLayout.getHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setQuantity(false);
                  },
                  child: AppIcon(icon: Icons.remove, backgroundcolor: AppColors.mainColor, iconColor: Colors.white,iconSize: AppLayout.getHeight(24)),
                ),
                BigText(text: "\$${product.price!}  X  ${controller.inCartItems }", color: AppColors.mainBlackColor,size: AppLayout.getHeight(26),),
                GestureDetector(
                  onTap: () {
                    controller.setQuantity(true);
                  },
                  child: AppIcon(icon: Icons.add, backgroundcolor: AppColors.mainColor, iconColor: Colors.white,iconSize: AppLayout.getHeight(24)),
                )
              ],
            ),
          ),
          Container(
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
              
               padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                color: Colors.white,
              ),
              child: Icon(Icons.favorite, color: AppColors.mainColor,),
            ),

            GestureDetector(
              onTap: () {
                controller.addItem(product);
              },
              child: Container(
              // height: AppLayout.getHeight(70),
              // width: AppLayout.getWidth(150),
              padding: EdgeInsets.only(top:AppLayout.getHeight(20), bottom: AppLayout.getHeight(20), left: AppLayout.getWidth(20),right: AppLayout.getWidth(20) ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                color: AppColors.mainColor,
              ),
              child: Center(child: BigText(text: "\$ ${product.price!} | Add to cart",size: AppLayout.getHeight(18), color: Colors.white,)),
            ),
            )
          ],
        ),
      ),
 
        ],
      );

      })
    );
  }
}
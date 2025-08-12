import 'dart:convert';

import 'package:e_commerce_app/Models/CartModel.dart';
import 'package:e_commerce_app/base/No_data_page.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
     var getCartHistoryList = Get.find<CartController>()
     .getCartHistoryList().reversed.toList();
     Map <String, int> cartItemsPerOrder = Map(); 
  
  for(int i=0; i < getCartHistoryList.length; i++){
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
    }else{
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
    }
    
  }
  
  List<int> cartItemsPerOrderToList(){
     return cartItemsPerOrder.entries.map((e)=>e.value).toList();      
}
 List<String> cartOrderTimeToList(){
     return cartItemsPerOrder.entries.map((e)=>e.key).toList();      
}
  List<int> itemsPerOrder = cartItemsPerOrderToList();
  
  var listCounter=0;
  Widget timeWidget(int index){
    var outputDate =DateTime.now().toString();
    if(index<getCartHistoryList.length){
      DateTime parseDate= DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat("MM/dd/yyy hh:mm a");
      outputDate = outputFormat.format(inputDate);
      
    }
    return BigText(text: outputDate);
    

  }
    return Scaffold(
      
      body: Column(
        children: [
          Container(
           width: double.maxFinite,
            height: AppLayout.getHeight(100),
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: AppLayout.getHeight(45)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined, 
                backgroundcolor: AppColors.yellowColor,
                iconColor: AppColors.mainColor,)

              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController){
            return
             _cartController.getCartHistoryList().length>0 ?
            Expanded(
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                top: AppLayout.getHeight(20),
                left: AppLayout.getWidth(20),
                 right: AppLayout.getWidth(20),
            
              ),
              child:MediaQuery.removePadding(
                removeTop: true,
                context: context, child: ListView(
                children: [
                  for(int i=0; i<itemsPerOrder.length; i++)
                  Container(
                    height: AppLayout.getHeight(125),
                    margin: EdgeInsets.only(bottom: AppLayout.getHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        timeWidget(listCounter),
            
                        SizedBox(height: AppLayout.getHeight(10),),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: 
                                      List.generate(itemsPerOrder[i], (index){
                                        if(listCounter<getCartHistoryList.length){
                                          listCounter++;
                                        }
                                        return 
                                        // index<=2?
                                         Container(
                                              height: AppLayout.getHeight(80),
                                              width: AppLayout.getHeight(80),
                                              margin: EdgeInsets.only(right: AppLayout.getWidth(5)),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(AppLayout.getHeight(8)),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(getCartHistoryList[listCounter-1].img!))
                                              ),
                                                                      
                                            
                                                                               );
                                         
                                        //  : Container();
                                      }),
                                      
                                      ),
                                    ),
                                ),
                               
                                Container(                              
                                  height: AppLayout.getHeight(80),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Smalltext(text: "Total", color: AppColors.titleColor,),
                                      BigText(text: itemsPerOrder[i].toString()+" Items", color: AppColors.titleColor, ),
                                      GestureDetector(
                                        onTap: () {
                                          var orderTime = cartOrderTimeToList();
                                          Map<int, CartModel> moreOrder ={};
                                          for(int j=0; j<getCartHistoryList.length; j++){
                                            if(getCartHistoryList[j].time==orderTime[i]){
                                              
                                              // print("The cart or product id is "+getCartHistoryList[j].product!.id.toString());
                                              moreOrder.putIfAbsent(getCartHistoryList[j].id!, ()=>
                                                CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                              );
                                             
                                            }
                            
                                          }
                                          Get.find<CartController>().setItems = moreOrder;
                                          Get.find<CartController>().addToCartList();
                                          Get.toNamed(RouteHelper.getCartPage());
                            
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10), vertical: AppLayout.getHeight(5)),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(AppLayout.getHeight(5)),
                                            border: Border.all(width: 1,color: AppColors.mainColor),
                                            
                                          ),
                                          child: Smalltext(text: "one more", color: AppColors.mainColor,),
                                        ),
                                      )
                                    ],
                                  ) ,
                                ),
                              ],
                            ),
                        
                        
                      ],
                    ),
                  )

                  
                ],
              ),
 )            
              
              ),
          )
          // ignore: avoid_unnecessary_containers
          :SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: const Center(
              child: NoDataPage(text: "You haven't bought anything so far !",
                        imgPath: "assets/images/empty_box.png",),
            ));
          })

        ],
      ),
    );
  }
}
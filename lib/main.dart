import 'package:e_commerce_app/Pages/Home/classWork.dart';
import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/Pages/cart/Cart_page.dart';
import 'package:e_commerce_app/Pages/food/Popular_food_details.dart';
import 'package:e_commerce_app/Pages/food/recommended_food_detail.dart';
import 'package:e_commerce_app/controllers/Recommended_products_controller.dart';
import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData( 
               
        
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      @override
Widget build(BuildContext context) {
  Get.find<PopularProductController>().getPopularProductList();
   Get.find<RecommendedProductController>().getRecommendedProductList();
  AppLayout.init(context); // 🔑 Initialize with current context
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,

    home: Mainfoodpage(),
     initialRoute: RouteHelper.initial,
    getPages: RouteHelper.routes,
  );
}

   
}


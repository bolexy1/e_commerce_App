import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/Pages/food/Popular_food_details.dart';
import 'package:e_commerce_app/utility/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
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
  AppLayout.init(context); // 🔑 Initialize with current context
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PopularFoodDetails(),
  );
}

   
}


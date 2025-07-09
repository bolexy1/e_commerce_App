import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/Pages/food/Popular_food_details.dart';
import 'package:e_commerce_app/Pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial="/";
  static const String popularFood = "/popular-food";
   static const String recommendedFood = "/recommended-food";


  static String getInitial()=>'$initial';

  static String getPopularFood()=>'$popularFood';

  static String getRecommendedFood()=>'$recommendedFood';


  static List<GetPage> routes=[
    GetPage(name: initial, page: (){
      
      return Mainfoodpage();
      
      }),
    GetPage(name: popularFood, page: (){


      return PopularFoodDetails();
      },
          transition: Transition.fadeIn
      ), 

      GetPage(name: recommendedFood, page: (){
       return RecommendedFoodDetail();
      })
  ];
}
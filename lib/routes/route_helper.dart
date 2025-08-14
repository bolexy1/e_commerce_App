import 'package:e_commerce_app/Pages/Home/home_page.dart';
import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/Pages/auth/sign_in_page.dart';
import 'package:e_commerce_app/Pages/cart/Cart_page.dart';
import 'package:e_commerce_app/Pages/food/Popular_food_details.dart';
import 'package:e_commerce_app/Pages/food/recommended_food_detail.dart';
import 'package:e_commerce_app/Pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashpage="/splash-page";
  static const String initial="/";
  static const String popularFood = "/popular-food";
   static const String recommendedFood = "/recommended-food";
   static const String cartPage = '/cart-page';
   static const String signIn = '/sign-in';
   

  static String getSplashPage()=>'$splashpage';
  static String getInitial()=>'$initial';

  static String getPopularFood(int pageId, String page )=>'$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage()=>"$cartPage";

  static String getSigninPage()=>"$signIn";


  static List<GetPage> routes=[

    GetPage(name: splashpage, page: ()=> SplashScreen()),
    GetPage(name: initial, page: (){
      
      return HomePage();
      
      }),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];


      return PopularFoodDetails(pageId:int.parse(pageId!), page:page!);
      },
          transition: Transition.fadeIn
      ), 

      GetPage(name: recommendedFood, page: (){
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
       return RecommendedFoodDetail(pageId:int.parse(pageId!), page:page!);
      },

      transition: Transition.fadeIn
      
      ),

      GetPage(name: cartPage, page: (){
        return  CartPage();
      },

      transition: Transition.fadeIn
      
      ),

      GetPage(name: signIn, page: (){
        return  SignInPage();
      },

      transition: Transition.fadeIn
      
      )
  ];
}
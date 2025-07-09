import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/Recommended_products_controller.dart';
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/data/Repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/Repository/recommended_product_repo.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:get/get.dart';
Future<void> init()async{
  // apiclients
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));


// Repos
  Get.lazyPut(()=> PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));

    Get.lazyPut(()=> PopularProductController(popularProductRepo: Get.find()));
    Get.lazyPut(()=> RecommendedProductController(recommendedProductRepo: Get.find()));


}
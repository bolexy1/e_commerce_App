// ignore: depend_on_referenced_packages
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList()async{
    return await apiClient.getData(AppConstants.RCOMMENDED_PRODUCT_URI);

  }
}

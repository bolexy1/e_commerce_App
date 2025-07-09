// ignore: depend_on_referenced_packages
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList()async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);

  }
}

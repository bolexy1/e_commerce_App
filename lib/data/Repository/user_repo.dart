import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({
    required this.apiClient
  });

   Future<Response> getUserInfo()async{
   return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
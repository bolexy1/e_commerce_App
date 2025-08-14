import 'package:e_commerce_app/Models/signUpBodyModel.dart';
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
  });

  Future<Response> registration(Signupbodymodel signupbody)async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signupbody.toJson());
  }

   bool UserLoggedIn(){
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserTOken()async{
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

   Future<Response> login(String email, String password)async{
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email":email, "password":password});
  }

  Future<bool> saveUserToken(String token)async{
    apiClient.token = token;
    apiClient.UpdateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
    
  }

  Future<void> saveUserNumberANdPassword(String number, String password)async{
    try {

     await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
      
    } catch (e) {
      throw e;
    }
  }

  bool clearShareData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token="";
    apiClient.UpdateHeader('');

    return true;
  }


}
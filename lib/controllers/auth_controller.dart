import 'package:e_commerce_app/Models/Response_Model.dart';
import 'package:e_commerce_app/Models/signUpBodyModel.dart';
import 'package:e_commerce_app/data/Repository/auth_repo.dart';
import 'package:e_commerce_app/utility/app_constants.dart';
import 'package:get/get.dart';
class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo
  });


  bool _isLoading = false;
  bool get isLoading =>_isLoading;


  Future<ResponseModel> registration(Signupbodymodel signupbody)async{
    _isLoading =true;
    update();
     Response response = await authRepo.registration(signupbody);
     late ResponseModel responseModel;
     if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);

     }else{
      responseModel = ResponseModel(false, response.statusText!);
     }
     _isLoading = false;
     update();
     return responseModel;

  }

  Future<ResponseModel> login(String email, String password)async{
    authRepo.getUserTOken();
    _isLoading =true;
    update();
     Response response = await authRepo.login(email, password);
     late ResponseModel responseModel;
     if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);

     }else{
      responseModel = ResponseModel(false, response.statusText!);
     }
     _isLoading = false;
     update();
     return responseModel;

  }

  void saveUserNumberANdPassword(String number, String password){
    authRepo.saveUserNumberANdPassword(number, password);
  }

  bool UserLoggedIn(){
    return authRepo.UserLoggedIn();
  }

   bool clearShareData(){
    return authRepo.clearShareData();
   }


}
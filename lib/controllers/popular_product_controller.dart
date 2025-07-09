// ignore: depend_on_referenced_packages
import 'package:e_commerce_app/Models/PopularProducts_model.dart';
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/data/Repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  // final ApiClient apiClient;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(
        Product.fromJson(response.body).products as Iterable ,
        
      );
      // print(_popularProductList);
      _isLoaded= true; 
      update(); 
    } else {
      
    }
  }
}

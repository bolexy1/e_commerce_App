// ignore: depend_on_referenced_packages
import 'package:e_commerce_app/Models/PopularProducts_model.dart';
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/data/Repository/recommended_product_repo.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
 

  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print("got products recommended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(
        Product.fromJson(response.body).products as Iterable<ProductModel>,
      );
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("got products recommended");
    }
  }
}

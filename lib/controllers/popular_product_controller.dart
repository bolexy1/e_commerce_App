// ignore: depend_on_referenced_packages
import 'package:e_commerce_app/Models/PopularProducts_model.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/data/Api/api_client.dart';
import 'package:e_commerce_app/data/Repository/popular_product_repo.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  // final ApiClient apiClient;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity=0;
  int get quantity => _quantity;
  int _inCartItems=0;
  int get inCartItems => _inCartItems+_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      
      // print("got products");
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

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity(_quantity+1);

    }else{
      _quantity =checkQuantity(_quantity-1);;

    }
    update();
  }
 int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar('item count', " you can't reduce more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white );
      return 0;
    }else if(quantity>20){
       Get.snackbar('item count', " you can't Add more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white );
      return 20;
    }else{
      return quantity;
    }
  }

void initProduct(ProductModel product, CartController cart){
  _quantity=0;
  _inCartItems= 0;
  _cart = cart;
  var exist=false;
  exist = _cart.existInCart(product);
  // get from storage _inCartItem
  print("exist or not "+exist.toString());
  if(exist){
    _inCartItems=cart.getQuantity(product);
  }
  print("the quantity in the cart is "+_inCartItems.toString());
}

void addItem(ProductModel product, ){
  if(_quantity>0){
  _cart.addItem(product, _quantity);
  _quantity=0;
  _cart.items.forEach((key, value){
    print("The id is "+value.id.toString()+" The qunatity is "+value.quantity.toString());
  });
}else{
  Get.snackbar('item count', " you Should  add at least one item in the cart!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white );

}
}
}

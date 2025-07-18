import 'package:e_commerce_app/Models/CartModel.dart';
import 'package:e_commerce_app/Models/PopularProducts_model.dart';
import 'package:e_commerce_app/data/Repository/cart_repo.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items={};

  Map<int, CartModel> get items =>_items;

  void addItem(ProductModel product, int quantity){
    var totalQuantity =0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModel(         
      id: product.id,
      name: product.name,      
      price: product.price,      
      img: product.img,
      quantity:value.quantity!+quantity,
      time:DateTime.now().toString(),
      isExist: true, 

        ) ;
      });

      if(totalQuantity<=0){
        _items.remove(product.id); 
      }
    }else{
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
     
      return CartModel(
      id: product.id,
      name: product.name,      
      price: product.price,      
      img: product.img,
      quantity:quantity,
      time:DateTime.now().toString(),
      isExist: true, 

    );
    
    }
      );
      }else{
        Get.snackbar('item count', " you Should  add at least one item in the cart!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white );
      }
  
      
    }
    
    }
    bool existInCart(ProductModel product){
      if(_items.containsKey(product.id)){
        return true;
      }
      return false;
    }

   getQuantity(ProductModel product){
      var quantity=0;
      if(_items.containsKey(product.id)){
        _items.forEach((key, value){
          if(key==product.id){
            quantity = value.quantity!;

          }

        });
        return quantity;
      }
    }
   int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value){
      totalQuantity += value.quantity!;

    });

    return totalQuantity;

   }
    

    List<CartModel> get getItems{
      return _items.entries.map((e) {
        return e.value;
      }).toList();
    }
  }

// ignore_for_file: avoid_print

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

// only for storage and sharedpreferences

  List<CartModel> storageItems=[];

  void addItem(ProductModel product, int quantity){
    var totalQuantity =0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModel(         
      id: value.id,
      name: value.name,      
      price: value.price,      
      img: value.img,
      quantity:value.quantity!+quantity,
      time:DateTime.now().toString(),
      isExist: true, 
      product: product,

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
      product: product

    );
    
    }
      );
      }else{
        Get.snackbar('item count', " you Should  add at least one item in the cart!",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white );
      }
  
      
    }
    cartRepo.addToCartList(getItems);
    update();
    
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

    int get totalAmount{
      var total =0;

      _items.forEach((key, value){
        total += value.quantity!*value.price!;

      });

      return total;
    }

    List<CartModel> getCartData(){
      setCart = cartRepo.getCartList();
      return storageItems;
    }

    set setCart(List<CartModel> items){
      storageItems=items;

      // ignore: prefer_interpolation_to_compose_strings
      print("length of cart items "+storageItems.length.toString());


      for (int i = 0; i < storageItems.length; i++) {

         _items.putIfAbsent(storageItems[i].product!.id!, ()=> storageItems[i]);
        
      }     
    }

    void addToHistory(){
      cartRepo.addToCartHistoryList();
      clear();
    }

    void clear(){
      _items={};
      update();
    }

    List<CartModel> getCartHistoryList(){
      return cartRepo.getCartHistoryList();
    }

    set setItems(Map<int, CartModel> setItems){
      _items = {};
      _items = setItems;
    }

    void addToCartList(){
      cartRepo.addToCartList(getItems);
      update();
    }
  }

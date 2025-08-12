import 'package:e_commerce_app/Pages/Account/accont_page.dart';
import 'package:e_commerce_app/Pages/Home/FaceBook.dart';
import 'package:e_commerce_app/Pages/Home/mainFoodPage.dart';
import 'package:e_commerce_app/Pages/Home/me.dart';
import 'package:e_commerce_app/Pages/auth/sign_up_page.dart';
import 'package:e_commerce_app/Pages/cart/Cart_history.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex =0;
  List pages = [
    Mainfoodpage(),
    SignUpPage(),
    CartHistory(),
    AccontPage(),
    Facebook(),


  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex =index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, ),
            label: "Home" 
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.archive,),
            label: "History" 
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "cart" 
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "Me" 
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "Me" 
            ),
        ]
      
      ),
    );
  }
}
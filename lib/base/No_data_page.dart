import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({super.key, required this.text,  this.imgPath ="assets/images/empty_cart.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppLayout.getHeight(100)),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imgPath,
            height: MediaQuery.of(context).size.height*0.22,
           width:  MediaQuery.of(context).size.width*0.22,
          
          ),
          SizedBox(height: AppLayout.getHeight(10),),
      
          Text(text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.0175,
            color:Theme.of(context).disabledColor
          ),
          textAlign: TextAlign.center,
          )
      
        ],
      ),
    );
  }
}
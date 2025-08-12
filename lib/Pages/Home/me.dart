import 'dart:math';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';


class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  
  final List<String> _generatedNumbers = [];
  final Random _random = Random();

  
  void _RandomNumber() {
  
    String firstDigit = ( _random.nextInt(9)).toString();
    
    String remainingDigits = '';
    for (int i = 0; i < 9; i++) {
      remainingDigits += _random.nextInt(10).toString();
    }

  
    final String randomNumber = firstDigit + remainingDigits;

    setState(() {
      _generatedNumbers.add(randomNumber);
    });
  }

  
  void _removeNumber() {
   
    if (_generatedNumbers.isNotEmpty) {
      setState(() {
        
        _generatedNumbers.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: AppLayout.getHeight(75)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                GestureDetector(
                  onTap: _RandomNumber,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(15),
                        vertical: AppLayout.getHeight(15)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                        color: Colors.greenAccent),
                    child: BigText(
                      text: 'Add number',
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                
                GestureDetector(
                  
                  onTap: _removeNumber,
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red),
                    child: Center(
                      child: BigText(                        
                        text: 'Remove',
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          Expanded(
            child: ListView.builder(
             padding: EdgeInsets.zero, 
              itemCount: _generatedNumbers.length,
              itemBuilder: (context, index) {
                return Padding(
                  
                  padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20),
                  child: Center(
                    child: Smalltext(
                      text: '${index + 1}.   ${_generatedNumbers[index]}',
                      size: 15,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
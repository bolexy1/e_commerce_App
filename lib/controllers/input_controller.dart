import 'package:flutter/material.dart';

class InputController extends StatefulWidget {
  const InputController({super.key});

  @override
  State<InputController> createState() => _InputControllerState();
}

class _InputControllerState extends State<InputController> {
    int counter = 0;

  void increment() {
    setState(() {
      counter++; // Increases the value by 1
    });
  }

  void get increase{
    return increment();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );


  }
}
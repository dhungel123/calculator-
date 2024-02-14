import 'package:calculator_app/caclulator_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CalculatorScreen(),
    );
  }

}
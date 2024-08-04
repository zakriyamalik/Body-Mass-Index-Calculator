import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData(

        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF0A0E21),
        ),

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold  ),

        ),



      ) ,

    );
  }
}

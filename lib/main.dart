import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          // headline1에 대한 TextStyle 정의. headline1을 정의하고 어디서 가져다가 쓰자.
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w800,
            fontFamily: 'parisienne',
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),

      home: HomeScreen(),
    ),
  );
}

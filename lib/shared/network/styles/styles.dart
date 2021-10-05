import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      elevation: 20,
    ),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        elevation: 0,
        //backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    textTheme: TextTheme(
      bodyText1: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      bodyText2: TextStyle(color: Colors.grey[600], fontSize: 15),
    ));
ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      elevation: 0,
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      bodyText2: TextStyle(color: Colors.grey[600], fontSize: 15),
    ));

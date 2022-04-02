import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const monoGray0 = Color(0xFFF5F6FA);
  static const monoGray1 = Color(0xFFDDE2E5);
  static const monoGray2 = Color(0xFFA1ABB3);
  static const monoGray3 = Color(0xFF637381);
  static const monoGray4 = Color(0xFF374558);
  static const primaryGreen = Color(0xFF417CD6);
  static const primaryBlack = Color(0xFF212A37);
  static const primaryAqua = Color(0xFF66B8BF);
  static const semanticDanger = Color(0xFFFF403D);
  static const semanticSuccess = Color(0xFF38C143);
  static const semanticWarning = Color(0xFFFFAB2D);
  static const primaryBlue = Color(0xFF417CD6);
  static const bluishGray = Color(0xFFAAAACC);
}

class AppImage {
  static const String icHome = 'assets/images/ic_home.svg';
}

class AppSound {}

class AppBorderRadius {
  static const rd_12 = Radius.circular(12);
  static const rd_50 = Radius.circular(50);
  static const rd_8 = Radius.circular(8);
  static const rd_20 = Radius.circular(20);
  static const rd_280 = Radius.circular(280);
  static const rd_40 = Radius.circular(40);
  static const rd_155 = Radius.circular(155);
  static const rd_0 = Radius.zero;
  static const rd_32 = Radius.circular(32);
  static const rd_64 = Radius.circular(64);
  static const rd_5 = Radius.circular(5);
  static const rd_100 = Radius.circular(100);
}

class AppStyle {
  static const TextStyle light = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w300,
    fontFamily: 'SFProDisplay',
  );

  static const TextStyle regular = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );

  static const TextStyle medium = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFUIDisplay',
  );

  static const TextStyle semibold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'SFUIDisplay',
  );

  static const TextStyle bold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: 'SFUIDisplay',
  );

  static const TextStyle superBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontFamily: 'SFUIDisplay',
  );
}
class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: Colors.deepOrange,
      //brightness: Brightness.light,
      elevation: 0,
      /// Задает цвет статус бара в зависимости от платформы
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    ),
  );
}

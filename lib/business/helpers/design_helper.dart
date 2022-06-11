// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

final hd = DesignHelper();

class DesignHelper {
  final _baseTheme = ThemeData.light();
  ThemeData get mainTheme => _baseTheme.copyWith(
// #region Colors
        hintColor: Colors.black.withOpacity(.5),
        scaffoldBackgroundColor: Colors.white.withOpacity(.9),
        // primaryColor: Colors.white,
        // colorScheme: _baseTheme.colorScheme
        //     .copyWith(primary: Colors.red),
// #endregion

// #region Themes
        iconTheme: IconThemeData(),
        appBarTheme: AppBarTheme(
          // color: Colors.red,
          centerTitle: true,
        ),
        cardTheme: CardTheme(),
        buttonTheme: ButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
// #endregion
      );

  TextStyle textStyle({
    Color color = ColorConstants.textColor,
    double size = 14,
    bool isBold = false,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
        // fontFamily: "",
      );
}

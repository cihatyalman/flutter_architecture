// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

final hd = DesignHelper();

class DesignHelper {
  final _baseTheme = ThemeData.light();
  ThemeData get mainTheme => _baseTheme.copyWith(
// #region Colors
        hintColor: Colors.black45,
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        primaryColor: ColorConstants.primaryColor,
        colorScheme: _baseTheme.colorScheme
            .copyWith(primary: ColorConstants.primaryColor),
// #endregion

// #region Themes
        textTheme: TextTheme(
          titleLarge: textStyle(),
          titleMedium: textStyle(),
          titleSmall: textStyle(),
          bodyLarge: textStyle(),
          bodyMedium: textStyle(),
        ),
        iconTheme: IconThemeData(color: Colors.black.withValues(alpha: .7)),
        appBarTheme: AppBarTheme(
            // color: ColorConstants.backgroundColor,
            // foregroundColor: ColorConstants.textColor,
            // centerTitle: false,
            // elevation: 0,
            // scrolledUnderElevation: 0,
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 2,
          highlightElevation: 0,
          backgroundColor: ColorConstants.primaryColor,
          shape: CircleBorder(),
        ),
        cardTheme: CardTheme(),
        buttonTheme: ButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: textStyle(color: Colors.black54),
          labelStyle: textStyle(color: Colors.black54),
          errorStyle: textStyle(color: Colors.red, size: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          yearForegroundColor: WidgetStatePropertyAll(ColorConstants.textColor),
          dayStyle: textStyle(size: 12),
        ),
        timePickerTheme: TimePickerThemeData(
          helpTextStyle:
              textStyle(color: ColorConstants.textColor, isBold: true),
          backgroundColor: Colors.white,
          dialTextStyle: textStyle(),
          hourMinuteTextStyle: textStyle(size: 40, isBold: true),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.grey.shade400,
        ),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
// #endregion
      );

  TextStyle textStyle({
    Color color = ColorConstants.textColor,
    double size = 14,
    bool isBold = false,
    bool isUnderLine = false,
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
        decoration: isUnderLine ? TextDecoration.underline : null,
        // fontFamily: "",
      );
}

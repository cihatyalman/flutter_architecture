// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

final hd = DesignHelper();

class DesignHelper {
  final _baseTheme = ThemeData.light();
  ThemeData get mainTheme => _baseTheme.copyWith(
// #region Colors
        hintColor: Colors.black.withValues(alpha: .5),
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        primaryColor: ColorConstants.primaryColor,
        colorScheme: _baseTheme.colorScheme
            .copyWith(primary: ColorConstants.primaryColor),
// #endregion

// #region Themes
        textTheme: TextTheme(titleMedium: textStyle()),
        iconTheme: IconThemeData(color: Colors.black.withValues(alpha: .7)),
        appBarTheme: AppBarTheme(
            // elevation: 0,
            // scrolledUnderElevation: 0,
            ),
        cardTheme: CardTheme(),
        buttonTheme: ButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textStyle(color: Colors.white.withValues(alpha: .5)),
          errorStyle: textStyle(color: Colors.red, size: 12),
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
  }) =>
      TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
        // fontFamily: "",
      );
}

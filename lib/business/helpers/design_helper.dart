// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/constants/color_constants.dart';

final hd = DesignHelper();

class DesignHelper {
  final _baseTheme = ThemeData.light();
  ThemeData get mainTheme => _baseTheme.copyWith(
// #region Colors
        hintColor: Colors.black.withOpacity(.5),
        scaffoldBackgroundColor: Colors.white.withOpacity(.9),
        // primaryColor: Colors.white,
// #endregion

// #region Themes
        iconTheme: IconThemeData(),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        cardTheme: CardTheme(),
        buttonTheme: ButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
// #endregion
      );

  SizedBox sizedBoxVertical([double height = 16]) => SizedBox(height: height);
  SizedBox sizedBoxHorizontal([double width = 8]) => SizedBox(width: width);

  EdgeInsets paddingAll([double value = 10]) => EdgeInsets.all(value);
  EdgeInsets paddingVertical([double value = 8]) =>
      EdgeInsets.symmetric(vertical: value);
  EdgeInsets paddingHorizontal([double value = 8]) =>
      EdgeInsets.symmetric(horizontal: value);

  BorderRadius radius([double radius = 8]) =>
      BorderRadius.all(Radius.circular(radius));

  BoxShadow get boxShadow => BoxShadow(
        color: Colors.black.withOpacity(.1),
        offset: const Offset(0, 4),
        blurRadius: 4,
      );
  BoxShadow get boxShadow2 => BoxShadow(
        color: Colors.black.withOpacity(.1),
        offset: Offset.zero,
        blurRadius: 8,
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

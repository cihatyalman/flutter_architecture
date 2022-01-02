// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final hd = DesignHelper();

class DesignHelper {
  final _baseTheme = ThemeData.light();
  ThemeData get mainTheme => _baseTheme.copyWith(
// #region Colors
        hintColor: Colors.black.withOpacity(.5),
        backgroundColor: Colors.black.withOpacity(.1),
// #endregion

// #region Themes
        iconTheme: IconThemeData(),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(),
        ),
        cardTheme: CardTheme(),
        buttonTheme: ButtonThemeData(),
        textButtonTheme: TextButtonThemeData(),
// #endregion
      );

// #region Custom Text Theme
  TextStyle textStyle10({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 10);
  TextStyle textStyle12({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 12);
  TextStyle textStyle14({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 14);
  TextStyle textStyle16({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 16);
  TextStyle textStyle18({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 18);
  TextStyle textStyle20({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 20);
  TextStyle textStyle24({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 24);
  TextStyle textStyle28({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 28);
  TextStyle textStyle36({int? colorType, bool? isBold}) =>
      _baseTextStyle(colorType, isBold).copyWith(fontSize: 36);

  TextStyle _baseTextStyle(int? colorType, bool? isBold) {
    isBold ??= false;
    Color _color;
    switch (colorType) {
      case 0:
        _color = Colors.white;
        break;
      case 1:
        _color = Colors.blue;
        break;
      default:
        _color = Colors.black;
    }
    return TextStyle(
      color: _color,
      // fontFamily: "",
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }
// #endregion
}

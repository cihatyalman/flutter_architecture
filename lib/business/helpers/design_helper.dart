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
}

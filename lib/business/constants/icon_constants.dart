// import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconConstants {
  static SvgPicture getSvg(
    String path, {
    Color color = Colors.black,
    double size = 16,
  }) =>
      SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color,
        fit: BoxFit.contain,
      );

  // static const logo = "assets/icons/logo.svg";
}

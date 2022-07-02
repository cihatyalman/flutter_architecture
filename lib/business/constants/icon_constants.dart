// import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconConstants {
  // static const logo = "assets/icons/logo.svg";

  static SvgPicture getSvg(
    String path, {
    Color? color,
    double size = 16,
  }) =>
      SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color,
        fit: BoxFit.contain,
      );
}

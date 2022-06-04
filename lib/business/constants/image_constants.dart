// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageConstants {
  static SvgPicture getSvg(
    String path, {
    Size size = const Size(double.infinity, 200),
    AlignmentGeometry alignment = Alignment.center,
    BoxFit fit = BoxFit.cover,
  }) =>
      SvgPicture.asset(
        path,
        width: size.width,
        height: size.width,
        fit: fit,
        alignment: alignment,
      );

  // static final logo = _getSvg("assets/images/logo.svg");
}

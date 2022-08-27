// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageConstants {
  // static final logo = _getSvg("assets/images/logo.svg");

}

extension SvgImageExtension on String {
  SvgPicture toSvgImage({
    Size size = const Size(double.infinity, 200),
    AlignmentGeometry alignment = Alignment.center,
    BoxFit fit = BoxFit.cover,
  }) =>
      SvgPicture.asset(
        this,
        width: size.width,
        height: size.width,
        fit: fit,
        alignment: alignment,
      );
}

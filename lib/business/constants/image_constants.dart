// import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ImageConstants {
  static SvgPicture _getSvg(String path) =>
      SvgPicture.asset(path, width: 160, height: 160);

  // static final logo = _getSvg("assets/images/logo.svg");
}

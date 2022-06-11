// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../../business/constants/color_constants.dart';
import '../project_widgets/widget_helper.dart';
import 'cached_image.dart';

class CirclePhoto extends StatelessWidget {
  String? imageUrl;
  double size;
  bool isBorder;
  Color backgroundColor;

  CirclePhoto({
    this.imageUrl,
    this.size = 44,
    this.isBorder = false,
    this.backgroundColor = ColorConstants.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(200),
      ),
      padding: hw.paddingAll(isBorder ? 4 : 0),
      child: CachedImage(imageUrl: imageUrl, radius: 200),
    );
  }
}

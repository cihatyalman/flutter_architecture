import 'package:flutter/material.dart';

mixin DesignMixin {
  SizedBox sizedBoxVertical([double height = 16]) => SizedBox(height: height);
  SizedBox sizedBoxHorizontal([double width = 8]) => SizedBox(width: width);

  EdgeInsets paddingAll([double value = 16]) => EdgeInsets.all(value);
  EdgeInsets paddingVertical([double value = 8]) =>
      EdgeInsets.symmetric(vertical: value);
  EdgeInsets paddingHorizontal([double value = 8]) =>
      EdgeInsets.symmetric(horizontal: value);

  BorderRadius radius([double radius = 16]) =>
      BorderRadius.all(Radius.circular(radius));

  BoxShadow get boxShadowDown => BoxShadow(
        color: Colors.black.withOpacity(.1),
        offset: const Offset(0, 4),
        blurRadius: 4,
      );
  BoxShadow get boxShadowCenter => BoxShadow(
        color: Colors.black.withOpacity(.1),
        offset: Offset.zero,
        blurRadius: 8,
      );
}

import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final bool ignoring;
  final double blurSize;
  final double radius;
  final Widget? child;

  const BlurWidget({
    super.key,
    this.width,
    this.height,
    this.ignoring = false,
    this.blurSize = 4,
    this.radius = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ignoring ? InkWell(child: _blurWidget()) : _blurWidget();
  }

  ClipRRect _blurWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSize, sigmaY: blurSize),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}

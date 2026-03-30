import 'package:flutter/material.dart';

import '../../widgets/custom/cached_image.dart';
import '../../widgets/custom/custom_animator.dart';
import '../../widgets/custom/overlay_dialog.dart';

class ImageOverlay extends OverlayDialog {
  final String imageUrl;

  ImageOverlay(this.imageUrl)
    : super(
        builder: (hideFn) {
          return CustomAnimator(
            tweenMap: {"main": Tween(begin: 0.0, end: 1.0)},
            curve: Curves.easeOutBack,
            builder: (value, state) {
              return Transform.scale(
                scale: value,
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [CachedImage(imageData: imageUrl)],
                  ),
                ),
              );
            },
            init: (animatorKey) {
              animatorKey.controller.forward();
            },
          );
        },
      );
}

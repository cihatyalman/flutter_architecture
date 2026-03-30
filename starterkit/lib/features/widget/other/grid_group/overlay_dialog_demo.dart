import 'package:flutter/material.dart';

import '../../../../widgets/custom/custom_animator.dart';
import '../../../../widgets/custom/overlay_dialog.dart';
import '../../../../widgets/project/c_text.dart';

class OverlayDialogDemo extends StatelessWidget {
  const OverlayDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = OverlayDialog(
      builder: (_) => CustomAnimator(
        tweenMap: {"main": Tween(begin: 0.0, end: 1.0)},
        curve: Curves.easeOutBack,
        builder: (value, state) {
          return Transform.scale(
            scale: value,
            child: Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CText("Şimdi bırakabilirsin"),
            ),
          );
        },
        init: (animatorKey) {
          animatorKey.controller.forward();
        },
      ),
    );

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CText("Buraya basılı tut"),
      ),
      onLongPressStart: (details) => overlay.show(context),
      onLongPressEnd: (details) => overlay.hide(),
    );
  }
}

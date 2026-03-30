import 'package:flutter/material.dart';

import '../../../../widgets/custom/blur_widget.dart';

class BlurWidgetDemo extends StatelessWidget {
  BlurWidgetDemo({super.key});

  final decoration = BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Container(
            decoration: decoration,
            child: FlutterLogo(size: 200),
          ),
        ),
        Expanded(
          child: Container(
            decoration: decoration,
            child: Stack(
              children: [
                FlutterLogo(size: 200),
                BlurWidget(blurSize: 8, width: double.infinity, height: 200),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

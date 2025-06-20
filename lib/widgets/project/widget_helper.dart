import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../helpers/design_mixin.dart';
import 'c_text.dart';

final hw = WidgetHelper();

class WidgetHelper with DesignMixin {
  final edgePadding = 12.0;
  final bottomPadding = 56.0;

  Widget logoWidget({double size = 140}) {
    return Center(
      child: ClipRRect(
        borderRadius: hw.radius(24),
        child: FlutterLogo(size: size),
      ),
    );
  }

  Widget circleLoading({
    Color color = ColorConstants.primaryColor,
    double padding = 8,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: CircularProgressIndicator(color: color),
          ),
        ),
      ),
    );
  }

  Widget emptyWidget() {
    return Center(
      child: Transform.scale(scale: 1.5, child: CText("Empty")),
    );
  }

  Widget divider() => const Divider(height: 8, thickness: .5);

  Widget dividerVertical([double height = 36]) =>
      SizedBox(height: height, child: const VerticalDivider());
}

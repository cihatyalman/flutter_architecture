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

  Widget circleLoading({Color color = ColorConstants.primaryColor}) => Center(
        child: CircularProgressIndicator(color: color),
      );

  Widget emptyWidget() {
    return Center(
      child: Transform.scale(scale: 1.5, child: CText("Empty")),
    );
  }
}

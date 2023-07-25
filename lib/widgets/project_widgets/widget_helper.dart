import 'package:flutter/material.dart';
import 'package:flutter_architecture/widgets/project_widgets/c_text.dart';

import '../../core/utils/mixins/context_mixin.dart';
import '../../helpers/design_mixin.dart';

final hw = WidgetHelper();

class WidgetHelper with DesignMixin, ContextMixin {
  final edgePadding = 12.0;
  final bottomPadding = 56.0;

  Widget logoWidget({double size = 140}) {
    return Center(
      child: ClipRRect(
        borderRadius: hw.radius(24),
        // child: Image.asset(IconConstants.logoPng, width: size, height: size),
        child: FlutterLogo(size: size),
      ),
    );
  }

  Widget circleLoading({Color color = Colors.black}) => Center(
        child: CircularProgressIndicator(color: color),
      );

  Widget emptyWidget() {
    return Align(
      alignment: Alignment.center.add(const Alignment(0, -.2)),
      child: Transform.scale(scale: 1.5, child: CText("Empty")),
      // child: Transform.scale(scale: 1.5, child: AnimConstants.emptyAnim),
    );
  }
}

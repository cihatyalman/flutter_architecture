import 'package:flutter/material.dart';

import '../../helpers/design_mixin.dart';

final hw = WidgetHelper();

class WidgetHelper with DesignMixin {
  Widget circleLoading({Color color = Colors.black}) => Center(
        child: CircularProgressIndicator(color: color),
      );
}

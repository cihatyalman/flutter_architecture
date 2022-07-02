import 'package:flutter/material.dart';

import '../../../business/helpers/design_mixin.dart';

final hw = WidgetHelper();

class WidgetHelper with DesignMixin {
  Widget circleLoading({Color? color}) => Center(
        child: CircularProgressIndicator(
          color: color ?? Colors.black,
        ),
      );
}

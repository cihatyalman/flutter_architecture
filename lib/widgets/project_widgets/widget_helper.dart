import 'package:flutter/material.dart';

import '../../core/utils/mixins/context_mixin.dart';
import '../../helpers/design_mixin.dart';

final hw = WidgetHelper();

class WidgetHelper with DesignMixin, ContextMixin {
  Widget circleLoading({Color color = Colors.black}) => Center(
        child: CircularProgressIndicator(color: color),
      );
}

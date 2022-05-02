import 'package:flutter/material.dart';

import '../../../exports/export_core.dart';

class CustomBottomSheet with ContextMixin {
  List<Widget> Function(StateSetter setState) children;
  Color color;
  double radius;
  bool isDismissible;
  EdgeInsets padding;

  CustomBottomSheet({
    required this.children,
    this.color = Colors.white,
    this.radius = 24,
    this.isDismissible = true,
    this.padding = EdgeInsets.zero,
  });

  show(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible,
        constraints: BoxConstraints(maxHeight: dynamicHeight(.9)),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: padding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children.call(setState),
                ),
              ),
            );
          });
        },
      );
}

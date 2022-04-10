import 'package:flutter/material.dart';

class CustomBottomSheet {
  Widget Function(StateSetter setState) child;
  double height;
  Color color;
  double radius;
  bool isDismissible;

  CustomBottomSheet({
    required this.child,
    this.height = 240,
    this.color = Colors.white,
    this.radius = 24,
    this.isDismissible = true,
  });

  show(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: height,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        ),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return child.call(setState);
            },
          );
        },
      );
}

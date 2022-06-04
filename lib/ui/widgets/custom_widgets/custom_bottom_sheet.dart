import 'package:flutter/material.dart';

class CustomBottomSheet {
  List<Widget> Function(StateSetter setState) children;
  Color color;
  double radius;
  bool isDismissible;
  EdgeInsets padding;
  double maxHeight;

  CustomBottomSheet({
    required this.children,
    this.color = Colors.white,
    this.radius = 24,
    this.isDismissible = true,
    this.padding = EdgeInsets.zero,
    this.maxHeight = .9,
  });

  Future show(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * maxHeight),
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

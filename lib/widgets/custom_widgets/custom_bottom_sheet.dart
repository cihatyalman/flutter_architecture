import 'package:flutter/material.dart';

class CustomBottomSheet {
  List<Widget> Function(StateSetter setState) children;
  Color color;
  double radius;
  bool isDismissible;
  EdgeInsets padding;
  double maxHeight;
  double dividerSize;
  Color dividerColor;
  bool isExpanded;

  CustomBottomSheet({
    required this.children,
    this.color = Colors.white,
    this.radius = 24,
    this.isDismissible = true,
    this.padding = EdgeInsets.zero,
    this.maxHeight = 300,
    this.dividerSize = 100,
    this.dividerColor = Colors.black,
    this.isExpanded = true,
  });

  Future show(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: isDismissible,
        constraints: BoxConstraints(
          maxHeight: maxHeight,
          minWidth: double.infinity,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(builder: (context, setState) {
              return Padding(
                padding: padding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (dividerSize != 0)
                      SizedBox(
                        width: dividerSize,
                        height: 24,
                        child: Divider(thickness: 2, color: dividerColor),
                      ),
                    isExpanded
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: children.call(setState),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: children.call(setState),
                            ),
                          ),
                  ],
                ),
              );
            }),
          );
        },
      );
}

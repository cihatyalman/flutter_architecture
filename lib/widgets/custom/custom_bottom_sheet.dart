import 'package:flutter/material.dart';

class CustomBottomSheet {
  List<Widget> Function(StateSetter setState) children;
  Widget? titleWidget;
  Color color;
  double radius;
  bool isDismissible;
  EdgeInsets padding;
  EdgeInsets scrollPadding;
  double maxHeight;
  double dividerSize;
  Color dividerColor;
  bool isExpanded;

  CustomBottomSheet({
    required this.children,
    this.titleWidget,
    this.color = Colors.white,
    this.radius = 16,
    this.isDismissible = true,
    this.padding = EdgeInsets.zero,
    this.scrollPadding = EdgeInsets.zero,
    this.maxHeight = 300,
    this.dividerSize = 48,
    this.dividerColor = Colors.black,
    this.isExpanded = true,
  });

  Future show(BuildContext context) => showModalBottomSheet(
        context: context,
        useRootNavigator: true,
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
                      Container(
                        width: dividerSize,
                        height: 4,
                        // margin: const EdgeInsets.symmetric(vertical: 8),
                        margin: const EdgeInsets.only(bottom: 8, top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: dividerColor,
                        ),
                      ),
                    if (titleWidget != null) ...[
                      titleWidget!,
                      const Divider(thickness: 1)
                    ],
                    isExpanded
                        ? Expanded(
                            child: SingleChildScrollView(
                              padding: scrollPadding,
                              physics: const ClampingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: children.call(setState),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            padding: scrollPadding,
                            physics: const ClampingScrollPhysics(),
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

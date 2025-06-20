import 'package:flutter/material.dart';

class CustomBottomSheet {
  List<Widget> Function(StateSetter setState)? children;
  Widget Function(StateSetter setState)? oneWidget;
  Widget? titleWidget;
  Color color;
  double radius;
  bool isDismissible;
  EdgeInsets padding;
  EdgeInsets scrollPadding;
  double dividerSize;
  Color dividerColor;

  CustomBottomSheet({
    this.children,
    this.oneWidget,
    this.titleWidget,
    this.color = Colors.white,
    this.radius = 16,
    this.isDismissible = true,
    this.padding = EdgeInsets.zero,
    this.scrollPadding = EdgeInsets.zero,
    this.dividerSize = 48,
    this.dividerColor = Colors.black,
  }) : assert(!(children == null && oneWidget == null));

  Future show(BuildContext context) => showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .9,
        ),
        isDismissible: isDismissible,
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
                        margin: const EdgeInsets.only(top: 12, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: dividerColor,
                        ),
                      ),
                    if (titleWidget != null) ...[
                      titleWidget!,
                      const Divider(thickness: 1)
                    ],
                    Flexible(
                      child: oneWidget?.call(setState) ??
                          SingleChildScrollView(
                            padding: scrollPadding,
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: children?.call(setState) ?? [],
                            ),
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

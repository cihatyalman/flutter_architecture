import 'package:flutter/material.dart';

import '../../helpers/design_helper.dart';
import '../custom/custom_menu.dart';
import '../project/widget_helper.dart';

class FilterButton extends StatefulWidget {
  int initialIndex;
  int itemCount;
  Widget Function(int index)? itemWidget;
  Future<void> Function(int index)? callback;
  Widget child;

  FilterButton({
    super.key,
    this.initialIndex = 0,
    required this.itemCount,
    this.itemWidget,
    this.callback,
    required this.child,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return CustomMenu(
      callback: (value) async {
        await widget.callback?.call(value);
        setState(() => _currentIndex = value);
      },
      itemList: List.generate(
        widget.itemCount,
        (index) => PopupMenuItem(
          height: 40,
          value: index,
          labelTextStyle: WidgetStatePropertyAll(
            hd.textStyle(isBold: _currentIndex == index).copyWith(
                decoration:
                    _currentIndex == index ? TextDecoration.underline : null),
          ),
          child: widget.itemWidget?.call(index) ?? Text("Item $index"),
        ),
      ),
      loadingWidget:
          hw.circleLoading(padding: 20, stroke: 2, color: Colors.black),
      child: Padding(
        padding: hw.paddingAll(hw.edgePadding),
        child: Icon(Icons.filter_alt_rounded, size: 18),
      ),
    );
  }
}

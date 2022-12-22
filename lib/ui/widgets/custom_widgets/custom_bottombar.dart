// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

final bottomBarIndexNotifier = ValueNotifier(0);

class CustomBottomBar extends StatelessWidget {
  List<BottomBarItemData> items;
  double height;
  Color backgroundColor;

  CustomBottomBar({
    required this.items,
    this.height = 60,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => onPressed(index),
              child: ValueListenableBuilder<int>(
                valueListenable: bottomBarIndexNotifier,
                builder: (_, value, __) => items[index].icon(value == index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(int index) {
    if (bottomBarIndexNotifier.value != index) {
      items[index].onChanged.call();
      bottomBarIndexNotifier.value = index;
    }
  }
}

class BottomBarItemData {
  Widget Function(bool isSelected) icon;
  void Function() onChanged;

  BottomBarItemData({
    required this.icon,
    required this.onChanged,
  });
}

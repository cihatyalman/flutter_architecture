// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../project/c_text.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final void Function(T item) onChanged;
  final Widget Function(T item)? itemWidget;
  final Widget? hint;
  final int startIndex;
  final Widget? icon;
  final double radius;

  CustomDropdown({
    required this.items,
    required this.onChanged,
    this.itemWidget,
    this.hint,
    this.startIndex = -1,
    this.icon,
    this.radius = 0,
  }) : assert(items.isNotEmpty || hint != null);

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? selectedItem;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    selectedItem =
        widget.startIndex == -1 ? null : widget.items[widget.startIndex];
  }

  @override
  Widget build(BuildContext context) {
    init();
    return DropdownButton<T>(
      isExpanded: true,
      underline: const SizedBox.shrink(),

      // Design
      hint: widget.hint ?? const Text("Bir seçim yapın"),
      icon: widget.icon,
      iconSize: 28,
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),

      // Controller
      value: selectedItem,
      onChanged: (value) {
        setState(() {
          selectedItem = value;
          widget.onChanged.call(value as T);
        });
      },
      items: widget.items
          .map((e) => DropdownMenuItem<T>(
                value: e,
                child: widget.itemWidget != null
                    ? widget.itemWidget!.call(e)
                    : CText(e.toString()),
              ))
          .toList(),
    );
  }
}

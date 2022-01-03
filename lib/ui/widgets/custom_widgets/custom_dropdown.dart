// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final void Function(T item) onChanged;
  final Widget Function(T item)? itemWidget;
  final Widget? hint;
  final int startIndex;

  CustomDropdown({
    required this.items,
    required this.onChanged,
    this.itemWidget,
    this.hint,
    this.startIndex = 0,
  }) : assert(items.isNotEmpty || hint != null);

  late ValueNotifier<T?> _selectedItem;

  @override
  Widget build(BuildContext context) {
    _selectedItem = ValueNotifier(hint != null ? null : items[startIndex]);
    return ValueListenableBuilder<T?>(
      valueListenable: _selectedItem,
      builder: (_, value, __) {
        return DropdownButton<T>(
          isExpanded: true,
          underline: const SizedBox.shrink(),

          // Design
          hint: hint,

          // Controller
          value: value,
          onChanged: (value) {
            _selectedItem.value = value;
            onChanged.call(value!);
          },
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: itemWidget != null
                        ? itemWidget!.call(e)
                        : Text(e.toString()),
                  ))
              .toList(),
        );
      },
    );
  }
}
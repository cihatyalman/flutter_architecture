// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_void_to_null, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomMultipleSelect<T> extends StatelessWidget {
  final List<MultipleSelectModel<T>> items;
  final Widget Function(MultipleSelectModel<T> item)? itemWidget;

  CustomMultipleSelect({required this.items, this.itemWidget});

  final _trigger = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.map((e) => _itemWidget(e)).toList(),
    );
  }

  Widget _itemWidget(MultipleSelectModel<T> item) {
    return ValueListenableBuilder<Null>(
      valueListenable: _trigger,
      builder: (_, value, __) {
        return InkWell(
          onTap: () {
            item.isSelected = !item.isSelected;
            _trigger.notifyListeners();
          },
          child: itemWidget != null
              ? itemWidget!.call(item)
              : Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.isSelected ? Colors.blue[200] : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: Offset(0, 8),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: FittedBox(child: Text(item.data.toString())),
                ),
        );
      },
    );
  }
}

class MultipleSelectModel<T> {
  late int index;
  late bool isSelected;
  late T data;

  MultipleSelectModel(this.index, this.isSelected, this.data);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["Index"] = index;
    map["IsSelected"] = isSelected;
    map["Data"] = data;
    return map;
  }
}

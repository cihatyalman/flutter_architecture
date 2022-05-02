// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_void_to_null, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MultipleSelectList<T> extends StatelessWidget {
  final List<MultipleSelectModel<T>> items;
  final Widget Function(MultipleSelectModel<T> item)? itemWidget;
  int? columnCount;
  void Function(List<T?> newList)? callback;

  MultipleSelectList({
    required this.items,
    this.itemWidget,
    this.columnCount,
    this.callback,
  });

  final _trigger = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return columnCount == null
        ? Wrap(
            children: items.map((e) => _itemWidget(e)).toList(),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount!),
            itemCount: items.length,
            itemBuilder: (context, index) => _itemWidget(items[index]),
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
            callback?.call(items
                .where((element) => element.isSelected)
                .map((e) => e.data)
                .toList());
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
  late T? data;

  MultipleSelectModel({
    this.index = 0,
    this.isSelected = false,
    this.data,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["Index"] = index;
    map["IsSelected"] = isSelected;
    map["Data"] = data;
    return map;
  }
}

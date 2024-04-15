// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_void_to_null, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class SelectableList<T> extends StatefulWidget {
  final List<SelectableListModel<T>> items;
  final Widget Function(SelectableListModel<T> item)? itemWidget;
  int? columnCount;
  void Function(List<T?> newList)? callback;
  bool isMultipleSelect;
  double childAspectRatio;

  SelectableList({
    required this.items,
    this.itemWidget,
    this.columnCount,
    this.callback,
    this.isMultipleSelect = false,
    this.childAspectRatio = 1,
  });

  @override
  State<SelectableList<T>> createState() => _SelectableListState<T>();
}

class _SelectableListState<T> extends State<SelectableList<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.columnCount == null
        ? Wrap(
            children: widget.items.map((e) => _itemWidget(e)).toList(),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.columnCount!,
              childAspectRatio: widget.childAspectRatio,
            ),
            itemCount: widget.items.length,
            itemBuilder: (context, index) => _itemWidget(widget.items[index]),
          );
  }

  Widget _itemWidget(SelectableListModel<T> item) {
    return InkWell(
      onTap: () {
        if (widget.isMultipleSelect) {
          item.isSelected = !item.isSelected;
          widget.callback?.call(widget.items
              .where((element) => element.isSelected)
              .map((e) => e.data)
              .toList());
        } else {
          for (var element in widget.items) {
            element.isSelected = element.index == item.index;
          }
          widget.callback?.call([item.data]);
        }
        setState(() {});
      },
      child: widget.itemWidget != null
          ? widget.itemWidget!.call(item)
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
  }
}

class SelectableListModel<T> {
  late int index;
  late bool isSelected;
  late T? data;

  SelectableListModel({
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

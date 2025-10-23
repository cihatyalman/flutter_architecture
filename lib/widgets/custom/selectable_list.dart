import 'package:flutter/material.dart';

import '../project/c_text.dart';

enum SelectableListType { list, wrap, grid }

class SelectableList<T> extends StatefulWidget {
  final SelectableListType viewType;
  final List<T> items;
  final List<int>? initialIndexList;
  final Widget Function(T item, bool isSelected)? itemWidget;
  void Function(List<int> newList)? callback;
  bool isMultipleSelect;
  double radius;
  double space; // list, wrap
  int? columnCount; // grid
  double childAspectRatio; // grid

  SelectableList({
    super.key,
    this.viewType = SelectableListType.list,
    required this.items,
    this.initialIndexList,
    this.itemWidget,
    this.callback,
    this.isMultipleSelect = false,
    this.radius = 8,
    this.space = 8,
    this.columnCount = 2,
    this.childAspectRatio = 2,
  });

  @override
  State<SelectableList<T>> createState() => _SelectableListState<T>();
}

class _SelectableListState<T> extends State<SelectableList<T>> {
  final selectedIndexList = <int>[];

  @override
  void initState() {
    super.initState();
    if (widget.initialIndexList != null) {
      selectedIndexList.addAll(widget.initialIndexList!);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.viewType) {
      case SelectableListType.list:
        return listView();
      case SelectableListType.wrap:
        return wrapView();
      case SelectableListType.grid:
        return gridView();
    }
  }

  Widget listView() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.items.length,
      separatorBuilder: (context, index) => SizedBox(height: widget.space),
      itemBuilder: (context, index) => _itemWidget(index, widget.items[index]),
    );
  }

  Widget wrapView() {
    return Wrap(
      runSpacing: widget.space,
      spacing: widget.space,
      children: List.generate(
        widget.items.length,
        (index) => _itemWidget(index, widget.items[index]),
      ),
    );
  }

  Widget gridView() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.columnCount!,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) => _itemWidget(index, widget.items[index]),
    );
  }

  Widget _itemWidget(int index, T data) {
    final isSelected = selectedIndexList.contains(index);
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      child: widget.itemWidget?.call(data, isSelected) ??
          CText(data.toString(), isBold: isSelected),
      onTap: () {
        setState(() {
          if (widget.isMultipleSelect) {
            if (selectedIndexList.contains(index)) {
              selectedIndexList.remove(index);
            } else {
              selectedIndexList.add(index);
            }
          } else {
            selectedIndexList.clear();
            selectedIndexList.add(index);
          }
        });
        widget.callback?.call(selectedIndexList);
      },
    );
  }
}

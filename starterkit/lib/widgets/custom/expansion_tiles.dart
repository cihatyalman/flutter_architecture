import 'package:flutter/material.dart';

import '../project/c_text.dart';

enum ExpansionTilesMode { single, multiple }

class ExpansionTileData {
  String? title;
  Widget? titleWidget;
  String? subTitle;
  Widget? subTitleWidget;
  Widget? leading;
  Widget? body;

  ExpansionTileData({
    this.title,
    this.titleWidget,
    this.subTitle,
    this.subTitleWidget,
    this.leading,
    this.body,
  });
}

class ExpansionTiles extends StatefulWidget {
  final List<ExpansionTileData> dataList;
  final ExpansionTilesMode mode;

  const ExpansionTiles({
    super.key,
    required this.dataList,
    this.mode = ExpansionTilesMode.single,
  });

  @override
  State<ExpansionTiles> createState() => _ExpansionTilesState();
}

class _ExpansionTilesState extends State<ExpansionTiles> {
  int selectedIndex = -1;

  late List<ExpansibleController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.dataList.length,
      (index) => ExpansibleController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.dataList.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, thickness: 1, color: Colors.grey),
        itemBuilder: (context, index) =>
            expansionTile(index, widget.dataList[index]),
      ),
    );
  }

  ExpansionTile expansionTile(int index, ExpansionTileData data) {
    return ExpansionTile(
      key: PageStorageKey(index),
      controller: controllers[index],
      onExpansionChanged: (value) => _handleExpansion(index, value),
      tilePadding: EdgeInsets.symmetric(horizontal: 8),
      childrenPadding: EdgeInsets.zero,
      shape: Border.all(style: BorderStyle.none),
      collapsedIconColor: Colors.grey,
      iconColor: Colors.grey,
      splashColor: Colors.transparent,
      dense: true,
      leading: data.leading,
      title: data.titleWidget ?? CText(data.title, textAlign: TextAlign.start),
      subtitle:
          data.subTitleWidget ??
          (data.subTitle != null
              ? CText(data.subTitle, size: 12, textAlign: TextAlign.start)
              : null),
      children: [data.body ?? SizedBox.shrink()],
    );
  }

  void _handleExpansion(int index, bool isExpanded) {
    if (widget.mode == ExpansionTilesMode.multiple) return;

    if (isExpanded) {
      for (int i = 0; i < controllers.length; i++) {
        if (i != index && controllers[i].isExpanded) {
          controllers[i].collapse();
        }
      }
    }
  }
}

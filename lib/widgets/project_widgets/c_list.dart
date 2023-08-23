// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'widget_helper.dart';

class CList<T> extends StatelessWidget {
  final scrollController = ScrollController();

  bool isLoading;
  List<T> dataList;
  Widget Function(T item, int index) itemWidget;
  Future<void> Function() onRefresh;
  Future<void> Function() onContinue;
  void Function(ScrollController scrollController)? callback;
  double edgePadding;
  double bottomPadding;

  CList({
    Key? key,
    required this.isLoading,
    required this.dataList,
    required this.itemWidget,
    required this.onRefresh,
    required this.onContinue,
    this.callback,
    this.edgePadding = 12,
    this.bottomPadding = 56,
  }) : super(key: key) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onContinue.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    callback?.call(scrollController);
    if (isLoading && dataList.isEmpty) return hw.circleLoading();
    if (dataList.isEmpty) return hw.emptyWidget();
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: hw.paddingAll(edgePadding).copyWith(bottom: bottomPadding),
        separatorBuilder: (context, index) => hw.sizedBoxVertical(edgePadding),
        itemCount: dataList.length + 1,
        itemBuilder: (context, index) {
          if (index == dataList.length) {
            return isLoading ? hw.circleLoading() : const SizedBox.shrink();
          }
          return itemWidget(dataList[index], index);
        },
      ),
    );
  }
}

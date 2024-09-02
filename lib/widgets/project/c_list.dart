// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'widget_helper.dart';

class CList<T> extends StatelessWidget {
  bool isLoading;
  List<T> dataList;
  Widget Function(T item, int index) itemWidget;
  void Function()? onContinue;
  Future<void> Function()? onRefresh;
  double topPadding;
  double edgePadding;
  double bottomPadding;
  bool shrinkWrap;
  bool reverse;
  bool isPhysics;
  Widget? emptyWidget;

  CList({
    super.key,
    required this.isLoading,
    required this.dataList,
    required this.itemWidget,
    this.onContinue,
    this.onRefresh,
    this.topPadding = 8,
    this.edgePadding = 12,
    this.bottomPadding = 56,
    this.shrinkWrap = false,
    this.reverse = false,
    this.isPhysics = false,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && dataList.isEmpty) return hw.circleLoading();
    if (dataList.isEmpty) return emptyWidget ?? hw.emptyWidget();
    return onRefresh != null
        ? RefreshIndicator(onRefresh: onRefresh!, child: _buildWidget())
        : _buildWidget();
  }

  ListView _buildWidget() {
    return ListView.separated(
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      physics: isPhysics
          ? const AlwaysScrollableScrollPhysics()
          : const ClampingScrollPhysics(),
      padding: hw
          .paddingHorizontal(edgePadding)
          .copyWith(bottom: bottomPadding, top: topPadding),
      separatorBuilder: (context, index) => hw.sizedBoxVertical(edgePadding),
      itemCount: dataList.length + 1,
      itemBuilder: (context, index) {
        if (index == dataList.length) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => onContinue?.call());
          return isLoading ? hw.circleLoading() : const SizedBox.shrink();
        }
        return itemWidget(dataList[index], index);
      },
    );
  }
}

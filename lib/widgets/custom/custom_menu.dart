import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final Future<void> Function(dynamic value)? callback;
  final List<PopupMenuItem> itemList;
  final double offset;
  final Widget? loadingWidget;
  final Widget child;

  CustomMenu({
    super.key,
    this.callback,
    this.offset = 48,
    required this.itemList,
    this.loadingWidget,
    required this.child,
  });

  final _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      offset: Offset(0, offset),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (_, value, __) {
          if (loadingWidget != null && value) return loadingWidget!;
          return child;
        },
      ),
      itemBuilder: (BuildContext context) => itemList,
      onSelected: (value) async {
        _isLoading.value = true;
        await callback?.call(value);
        _isLoading.value = false;
      },
    );
  }
}

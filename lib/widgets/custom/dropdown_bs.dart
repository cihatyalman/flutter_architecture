import 'package:flutter/material.dart';

import '../project/c_text.dart';
import '../project/widget_helper.dart';

class DropdownBS extends StatelessWidget {
  DropdownBS({
    super.key,
    required this.dataList,
    this.initialData,
    this.title,
    this.icon,
    this.bsSelectedColor = Colors.black,
    this.bsAlignment = Alignment.center,
    this.callback,
  });

  final Map<String, dynamic> dataList;
  final String? initialData;
  final String? title;
  final Widget? icon;
  final Color bsSelectedColor;
  final Alignment bsAlignment;
  final void Function(String? value)? callback;

  final _notifier = ValueNotifier<String?>(null);
  void _init() {
    _notifier.value = initialData;
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 48,
        padding: hw.paddingHorizontal(12),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: hw.radius(8),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ValueListenableBuilder<String?>(
          valueListenable: _notifier,
          builder: (_, value, __) {
            return Row(
              children: [
                if (icon != null) ...[icon!, hw.sizedBoxHorizontal(12)],
                Expanded(
                  child: CText(value == null ? title : dataList[value]),
                ),
                hw.sizedBoxHorizontal(),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            );
          },
        ),
      ),
      onTap: () async {
        final res = await _showBS(context);
        if (res != null) {
          _notifier.value = res;
          callback?.call(res);
        }
      },
    );
  }

  Future _showBS(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: true,
      constraints: BoxConstraints(
        maxHeight: mediaQuery.size.height * .5,
        minWidth: double.infinity,
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: mediaQuery.viewInsets.bottom,
          ),
          child: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _titleWidget(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12)
                        .copyWith(bottom: 48),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) =>
                        _itemWidget(context, dataList.entries.toList()[index]),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  Widget _titleWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 4,
          margin: const EdgeInsets.only(bottom: 8, top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black26,
          ),
        ),
        CText(title, isBold: true, size: 16),
        const Divider(thickness: 1),
      ],
    );
  }

  Widget _itemWidget(BuildContext context, MapEntry<String, dynamic> data) {
    final isSelected = _notifier.value == data.key;
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: bsAlignment,
        decoration: BoxDecoration(
          color: isSelected ? bsSelectedColor : Colors.transparent,
          borderRadius: hw.radius(8),
        ),
        child: CText(
          data.value,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      onTap: () => Navigator.pop(context, data.key),
    );
  }
}

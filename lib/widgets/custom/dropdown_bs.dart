// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../project/c_text.dart';
import '../project/widget_helper.dart';
import 'custom_input.dart';

class DropdownBS extends StatelessWidget {
  final Map<String, dynamic> dataList;
  final String? initialData;
  final String? title;
  final Widget? icon;
  final Color bsSelectedColor;
  final Alignment bsAlignment;
  final bool searchInputEnabled;
  final String? searchInputHintText;
  final void Function(String? value)? callback;

  DropdownBS({
    super.key,
    required this.dataList,
    this.initialData,
    this.title,
    this.icon,
    this.bsSelectedColor = Colors.black,
    this.bsAlignment = Alignment.center,
    this.searchInputEnabled = false,
    this.searchInputHintText,
    this.callback,
  });

  final selectedKeyNotifier = ValueNotifier<String?>(null);
  final viewListNotifier = ValueNotifier(<String, dynamic>{});

  void _init() {
    selectedKeyNotifier.value = initialData;
    viewListNotifier.value = dataList;
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
        child: Row(
          children: [
            if (icon != null) ...[icon!, hw.sizedBoxHorizontal(12)],
            Expanded(
              child: ValueListenableBuilder<String?>(
                valueListenable: selectedKeyNotifier,
                builder: (_, value, __) {
                  return CText(
                      value == null ? title : viewListNotifier.value[value]);
                },
              ),
            ),
            hw.sizedBoxHorizontal(),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
      onTap: () async {
        final res = await _showBS(context);
        if (res != null) {
          selectedKeyNotifier.value = res;
          callback?.call(res);
        }
      },
    );
  }

  Future _showBS(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    viewListNotifier.value = dataList;
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
                if (searchInputEnabled) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      height: 40,
                      child: CustomInput(
                        borderType: 1,
                        borderActiveColor: Colors.black45,
                        borderPassiveColor: Colors.black26,
                        hintText: searchInputHintText,
                        onChanged: (value) {
                          if (value == null) {
                            viewListNotifier.value = dataList;
                          } else {
                            viewListNotifier.value =
                                Map.fromEntries(dataList.entries.where(
                              (e) => e.value
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()),
                            ));
                          }
                        },
                      ),
                    ),
                  ),
                  hw.sizedBoxVertical(12),
                ],
                Expanded(
                  child: ValueListenableBuilder<Map<String, dynamic>>(
                    valueListenable: viewListNotifier,
                    builder: (_, value, __) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 12)
                            .copyWith(bottom: 48),
                        itemCount: value.length,
                        itemBuilder: (context, index) =>
                            _itemWidget(context, value.entries.toList()[index]),
                      );
                    },
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
    final isSelected = selectedKeyNotifier.value == data.key;
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

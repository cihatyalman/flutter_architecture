import 'package:flutter/material.dart';

import '../../../utils/helpers/widget_helper.dart';
import '../../../widgets/project/c_list.dart';
import '../../../widgets/project/c_text.dart';
import 'mock_item_model.dart';

class CListDemo extends StatelessWidget {
  CListDemo({super.key});

  final loadingNotifier = ValueNotifier(false);
  List<MockItem> items = [];

  Future<void> createMockList([int count = 10]) async {
    loadingNotifier.value = true;
    await Future.delayed(Duration(seconds: 1));

    items = List.generate(
      count,
      (index) => MockItem(
        index: index,
        id: "id${index + 1}",
        title: "Item ${index + 1}",
      ),
    );
    loadingNotifier.value = false;
  }

  Future<void> addMockList([int count = 10]) async {
    loadingNotifier.value = true;
    await Future.delayed(Duration(seconds: 1));

    final lastIndex = (items.last.index ?? -1) + 1;
    final newList = List.generate(count, (index) {
      final newIndex = lastIndex + index;
      return MockItem(
        index: newIndex,
        id: "id${newIndex + 1}",
        title: "Item ${newIndex + 1}",
      );
    });
    items.addAll(newList);
    loadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    createMockList();

    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText("CList", isBold: true),
          CText(
            "Bir liste ile yapılacak bir çok şeyi barındırır. (loading, infinity scroll, reverse list)",
            size: 12,
          ),
          hw.divider(),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: loadingNotifier,
              builder: (_, value, _) {
                return CList(
                  padding: EdgeInsets.zero,
                  isLoading: value,
                  itemSpace: 8,
                  dataList: items,
                  itemWidget: (item, index) => itemWidget(item),
                  onRefresh: () => createMockList(),
                  onContinue: () {
                    if (!value) addMockList();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(MockItem item) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CText(item.title),
    );
  }
}

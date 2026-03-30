import 'package:flutter/material.dart';

import '../../../../utils/helpers/widget_helper.dart';
import '../../../../widgets/custom/custom_menu.dart';

class CustomMenuDemo extends StatelessWidget {
  CustomMenuDemo({super.key});

  final items = List.generate(
    10,
    (index) => PopupMenuItem(value: index, child: Text("Menu Item $index")),
  );

  @override
  Widget build(BuildContext context) {
    return CustomMenu(
      itemList: items,
      loadingWidget: hw.circleLoading(size: 16),
      callback: (value) async {
        await Future.delayed(Duration(seconds: 3));
        debugPrint("$value numaralı işlem tamamlandı.");
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(Icons.menu, size: 20),
      ),
    );
  }
}

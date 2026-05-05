import 'package:flutter/material.dart';

import '../../features/widget/exports.dart';
import '../../widgets/project/c_appbar.dart';

class ListWidgetScreen extends StatelessWidget {
  static const route = 'ListWidgetScreen';

  const ListWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceWidget = SizedBox(height: 12);

    return Scaffold(
      appBar: CAppBar(title: "Listeler").build(context),
      body: ListView(
        padding: EdgeInsets.all(12).copyWith(bottom: 56),
        physics: ClampingScrollPhysics(),
        children: [
          CListDemo(),
          spaceWidget,
          SelectableListDemo(),
          spaceWidget,
          ExpansionTilesDemo(),
        ],
      ),
    );
  }
}

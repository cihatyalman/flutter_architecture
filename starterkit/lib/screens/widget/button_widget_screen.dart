import 'package:flutter/material.dart';

import '../../features/widget/exports.dart';
import '../../utils/helpers/widget_helper.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_text.dart';

class ButtonWidgetScreen extends StatelessWidget {
  static const route = 'ButtonWidgetScreen';

  ButtonWidgetScreen({super.key});

  final spaceWidget = SizedBox(height: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: "Butonlar").build(context),
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(12).copyWith(bottom: 56),
        children: [
          titleWidget("Flutter Butonlar"),
          spaceWidget,
          FlutterButtonDemo(),
          hw.divider(),
          titleWidget("Custom Butonlar"),
          CustomButtonDemo(),
          spaceWidget,
        ],
      ),
    );
  }

  CText titleWidget(String title) => CText(title, isBold: true, size: 20);
}

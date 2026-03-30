import 'package:flutter/material.dart';

import '../../features/widget/exports.dart';
import '../../utils/helpers/widget_helper.dart';
import '../../widgets/project/c_appbar.dart';

class InputWidgetScreen extends StatelessWidget {
  static const route = 'InputWidgetScreen';

  const InputWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: "Inputlar").build(context),
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(12).copyWith(bottom: 56),
        children: [
          InputDemo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: hw.divider(),
          ),
          CalendarDemo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: hw.divider(),
          ),
          DropdownDemo(),
        ],
      ),
    );
  }
}

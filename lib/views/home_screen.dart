// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';
import '../widgets/custom_widgets/submit_button.dart';
import '../widgets/project_widgets/c_text.dart';
import '../widgets/project_widgets/widget_helper.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';

  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: CText(route)),
      body: Padding(
        padding: hw.paddingAll(),
        child: ListView(
          children: [
            hw.sizedBoxVertical(),
            vm.dataNotifier.listenWidget((data) => textWidget(data)),
            hw.sizedBoxVertical(),
            Row(
              children: [
                Expanded(child: decrementButton()),
                hw.sizedBoxHorizontal(),
                Expanded(child: incrementButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidget(int data) {
    return Center(child: CText(data.toString()));
  }

  Widget incrementButton() {
    return SubmitButton(
      titleWidget: const Icon(Icons.add),
      onTap: () => vm.increment(),
    );
  }

  Widget decrementButton() {
    return SubmitButton(
      titleWidget: const Icon(Icons.remove),
      onTap: () => vm.decrement(),
    );
  }
}

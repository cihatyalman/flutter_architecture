import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';
import '../widgets/project/c_bottombar.dart';
import '../widgets/project/c_text.dart';
import '../widgets/project/widget_helper.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';
  HomeScreen({super.key});

  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: CText(route)),
      bottomNavigationBar: cBottomBar.bottomBar(0),
      body: Padding(
        padding: hw.paddingHorizontal(hw.edgePadding),
        child: Column(
          children: [
            hw.sizedBoxVertical(),
            vm.dataStore.listen((data, _) => textWidget(data)),
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
    return FilledButton(
      child: const Icon(Icons.add),
      onPressed: () => vm.increment(),
    );
  }

  Widget decrementButton() {
    return FilledButton(
      child: const Icon(Icons.remove),
      onPressed: () => vm.decrement(),
    );
  }
}

import 'package:flutter/material.dart';
import '../../shared/constants/color_constants.dart';
import 'counter_repository.dart';
import 'counter_view_model.dart';

import '../../widgets/project/c_text.dart';

class CounterDemo extends StatelessWidget {
  CounterDemo({super.key});
  final vm = CounterViewModel(CounterRepository.instance);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        textWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [decrementButton(), resetButton(), incrementButton()],
        ),
      ],
    );
  }

  Widget textWidget() {
    return Container(
      alignment: Alignment.center,
      width: 56,
      child: vm.store.counter.listen(
        (data, _) => CText(data.toString(), isBold: true, size: 40),
      ),
    );
  }

  Widget decrementButton() {
    return GestureDetector(
      onTap: () => vm.decrement(),
      onLongPressStart: (details) => vm.decrementLong(true),
      onLongPressEnd: (details) => vm.decrementLong(false),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.primary,
        ),
        child: Icon(Icons.remove, color: Colors.white),
      ),
    );
  }

  Widget incrementButton() {
    return GestureDetector(
      onTap: () => vm.increment(),
      onLongPressStart: (details) => vm.incrementLong(true),
      onLongPressEnd: (details) => vm.incrementLong(false),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.primary,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget resetButton() {
    return GestureDetector(
      onTap: () => vm.reset(),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.primary,
        ),
        child: Icon(Icons.restart_alt_rounded, color: Colors.white),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MultiNotifier extends StatelessWidget {
  List<ValueNotifier> notifierList;
  Widget Function(List valueList) builder;

  MultiNotifier({
    required this.notifierList,
    required this.builder,
  });

  late List valueList;

  @override
  Widget build(BuildContext context) {
    valueList = List.generate(notifierList.length, (index) => null);
    return _loop(0);
  }

  Widget _loop(int index) {
    return ValueListenableBuilder(
        valueListenable: notifierList[index],
        builder: (_, v, __) {
          valueList[index] = v;
          if (index + 1 < notifierList.length) {
            return _loop(index + 1);
          }
          return builder.call(valueList);
        });
  }
}

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MultiBloc extends StatelessWidget {
  List<Stream> streamList;
  List? initialDataList;
  Widget Function(List valueList) builder;

  MultiBloc({
    required this.streamList,
    required this.builder,
    this.initialDataList,
  });

  late List valueList;

  @override
  Widget build(BuildContext context) {
    valueList = List.generate(streamList.length, (index) => null);
    initialDataList ??= valueList;
    return _loop(0);
  }

  Widget _loop(int index) {
    return StreamBuilder(
      stream: streamList[index],
      initialData: initialDataList![index],
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          valueList[index] = snapshot.data;
          if (index + 1 < streamList.length) {
            return _loop(index + 1);
          }
        }
        return builder.call(valueList);
      },
    );
  }
}

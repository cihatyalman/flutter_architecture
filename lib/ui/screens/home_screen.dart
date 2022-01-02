// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';

  late _ScreenWidgets screenWidgets;
  final screenData = _ScreenData();

  @override
  Widget build(BuildContext context) {
    screenWidgets = _ScreenWidgets(this);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text(route)),
      body: Column(
        children: [
          screenWidgets.body(route),
        ],
      ),
    );
  }
}

class _ScreenWidgets {
  final HomeScreen widget;
  _ScreenWidgets(this.widget);

  Widget body(String text) {
    return Center(child: Text(text));
  }
}

class _ScreenData {
  String? name;
  int? age;
  
  _ScreenData({
    this.name,
    this.age,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}

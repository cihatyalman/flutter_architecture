import 'package:flutter/material.dart';

import '../widgets/project/c_text.dart';

class ProfileScreen extends StatelessWidget {
  static const route = 'ProfileScreen';
  final RouteSettings settings;
  ProfileScreen({required this.settings});

  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: CText(route)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CText(route)),
        ],
      ),
    );
  }
}

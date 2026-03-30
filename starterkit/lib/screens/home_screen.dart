import 'package:flutter/material.dart';

import '../features/counter/exports.dart';
import '../widgets/project/c_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: "Anasayfa").build(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CounterDemo()],
      ),
    );
  }
}

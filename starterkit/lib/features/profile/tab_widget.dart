import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TabBar(
        tabs: [
          Icons.grid_view_rounded,
          Icons.now_widgets_rounded,
        ].map((e) => Tab(icon: Icon(e))).toList(),
      ),
    );
  }
}

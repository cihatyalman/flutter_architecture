import 'package:flutter/material.dart';

import '../../../widgets/project/c_text.dart';

class ImageWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const ImageWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Expanded(child: SizedBox.expand(child: child)),
          CText(title),
        ],
      ),
    );
  }
}

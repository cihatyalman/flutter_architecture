// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../project/c_text.dart';
import '../project/widget_helper.dart';

class ExpansionButton extends StatefulWidget {
  String title;
  Widget? child;

  ExpansionButton({
    required this.title,
    this.child,
  });

  @override
  State<ExpansionButton> createState() => _ExpansionButtonState();
}

class _ExpansionButtonState extends State<ExpansionButton> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: hw.radius(12),
      ),
      child: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        elevation: 0,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() => isOpen = isExpanded);
        },
        children: [
          ExpansionPanel(
            backgroundColor: Colors.transparent,
            isExpanded: isOpen,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 8),
              child: CText(widget.title, textAlign: TextAlign.start),
            ),
            body: widget.child ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

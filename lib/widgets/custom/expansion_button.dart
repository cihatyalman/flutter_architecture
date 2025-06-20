import 'package:flutter/material.dart';

import '../project/c_text.dart';
import '../project/widget_helper.dart';

class ExpansionButton extends StatefulWidget {
  String? title;
  Widget? titleWidget;
  Widget? child;

  ExpansionButton({
    super.key,
    this.title,
    this.titleWidget,
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
      padding: hw.paddingVertical(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: hw.radius(12),
        border: Border.all(color: Colors.black12),
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
              child: widget.titleWidget ??
                  CText(widget.title, textAlign: TextAlign.start),
            ),
            body: widget.child ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../project_widgets/c_text.dart';
import '../project_widgets/widget_helper.dart';

class ExpansionButton extends StatelessWidget {
  String title;
  Widget? child;

  ExpansionButton({
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = ValueNotifier(false);
    return ValueListenableBuilder<bool>(
      valueListenable: isOpen,
      builder: (_, value, __) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: hw.radius(12),
          ),
          child: ExpansionPanelList(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            expansionCallback: (panelIndex, isExpanded) {
              isOpen.value = !isExpanded;
            },
            children: [
              ExpansionPanel(
                backgroundColor: Colors.transparent,
                isExpanded: isOpen.value,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) => Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 8),
                  child: CText(title, textAlign: TextAlign.start),
                ),
                body: child ?? const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}

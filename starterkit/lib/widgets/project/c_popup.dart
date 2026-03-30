// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../utils/helpers/widget_helper.dart';
import '../custom/custom_button.dart';
import '../custom/custom_popup.dart';
import 'c_text.dart';

class CPopup {
  final double width;
  final bool buttonActive;
  final String trueButtonText;
  final String falseButtonText;
  final String? title;
  final List<Widget>? children;
  final Future<bool> Function(bool value)? callback;

  CPopup({
    this.width = 500,
    this.buttonActive = true,
    this.trueButtonText = "Evet",
    this.falseButtonText = "Vazgeç",
    this.title,
    this.children,
    this.callback,
  });

  Future show(BuildContext context) {
    return CustomPopup(
      width: width,
      children: [
        if (title != null) ...[
          CText(title, isBold: true, size: 16),
          hw.divider(),
        ],
        if ((children ?? []).isNotEmpty)
          Flexible(
            child: SingleChildScrollView(child: Column(children: children!)),
          ),
        if (buttonActive)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              hw.divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  _buildActionButton(
                    context: context,
                    accept: false,
                    buttonText: falseButtonText,
                  ),
                  _buildActionButton(
                    context: context,
                    accept: true,
                    buttonText: trueButtonText,
                  ),
                ],
              ),
            ],
          ),
      ],
    ).show(context);
  }

  Widget _buildActionButton({
    required BuildContext context,
    required bool accept,
    required String buttonText,
  }) {
    final theme = Theme.of(context);
    return CustomButton(
      height: 36,
      backgroundColor: accept ? theme.primaryColor : Colors.white,
      textColor: accept ? Colors.white : Colors.black,
      borderColor: accept ? theme.primaryColor : Colors.grey,
      title: buttonText,
      onPressed: () async {
        if (!accept) {
          callback?.call(accept);
          return Navigator.pop(context, accept);
        }
        final r = await callback?.call(accept);
        if (r == true) return Navigator.pop(context, accept);
      },
    );
  }
}

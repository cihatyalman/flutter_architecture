import 'package:flutter/material.dart';

import '../../../exports/export_widgets.dart';

enum PopUpType { success, warning, error, special }

class CustomPopUp {
  final PopUpType type;
  final Widget child;
  final String closeText;
  final String? acceptText;
  final Future Function()? closeFunction;
  final Future Function()? acceptFunction;
  final double aspectRatio;
  final void Function()? callback;

  CustomPopUp({
    this.type = PopUpType.success,
    required this.child,
    required this.closeText,
    this.acceptText,
    this.closeFunction,
    this.acceptFunction,
    this.aspectRatio = 1,
    this.callback,
  }) : assert(
          (acceptFunction != null && acceptText != null) ||
              acceptFunction == null,
        );

  show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Design
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,

        // Controller
        content: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: child),
                const SizedBox(height: 8),
                Row(
                  children: acceptFunction != null
                      ? [
                          Expanded(
                            child: _buildActionButton(
                              context: context,
                              accept: false,
                              buttonText: closeText,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildActionButton(
                              context: context,
                              accept: true,
                              buttonText: acceptText!,
                              buttonFunction: acceptFunction,
                            ),
                          ),
                        ]
                      : [
                          Expanded(
                            child: _buildActionButton(
                              context: context,
                              accept: true,
                              buttonText: closeText,
                              buttonFunction: closeFunction,
                            ),
                          )
                        ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required bool accept,
    required String buttonText,
    Future Function()? buttonFunction,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: accept ? _getColor(type) : null,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: ColorConstants.greyColor2),
      ),
      child: TextButton(
        child: CText(
          buttonText,
          color: accept ? Colors.white : _getColor(type),
        ),
        onPressed: () async {
          Navigator.pop(context);
          await buttonFunction?.call();
          callback?.call();
        },
      ),
    );
  }

  Color _getColor(PopUpType type) {
    switch (type) {
      case PopUpType.success:
        return Colors.green;
      case PopUpType.warning:
        return Colors.orange;
      case PopUpType.error:
        return Colors.red;
      case PopUpType.special:
      // return ColorConstants.primaryColor;
      default:
        return Colors.green;
    }
  }
}

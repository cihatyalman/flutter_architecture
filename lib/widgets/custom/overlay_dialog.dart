import 'package:flutter/material.dart';

class OverlayDialog {
  final Widget child;
  OverlayDialog(this.child) {
    _popupDialog = OverlayEntry(builder: (context) => _buildWidget());
  }

  late OverlayEntry _popupDialog;

  _buildWidget() {
    return Dialog.fullscreen(
      backgroundColor: Colors.black38,
      child: Center(child: child),
    );
  }

  void show(BuildContext context) => Overlay.of(context).insert(_popupDialog);

  void hide() => _popupDialog.remove();
}

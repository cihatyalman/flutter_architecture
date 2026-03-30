import 'package:flutter/material.dart';

class OverlayDialog {
  final Widget Function(VoidCallback hideFn) builder;

  late OverlayEntry _entry;

  OverlayDialog({required this.builder});

  void show(BuildContext context) {
    _entry = OverlayEntry(
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black38,
        child: Center(child: builder(hide)),
      ),
    );
    Overlay.of(context).insert(_entry);
  }

  void hide() => _entry.remove();
}

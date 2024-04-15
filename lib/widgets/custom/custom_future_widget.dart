// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomFutureWidget extends StatelessWidget {
  final Widget Function(ValueNotifier<bool> isLoading) builder;

  CustomFutureWidget({required this.builder});

  final isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (_, value, __) => builder.call(isLoading),
    );
  }
}

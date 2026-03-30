import 'package:flutter/material.dart';

class CustomFutureWidget extends StatelessWidget {
  final Widget Function(ValueNotifier<bool> isLoading) builder;

  CustomFutureWidget({super.key, required this.builder});

  final isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (_, value, _) => builder.call(isLoading),
    );
  }
}

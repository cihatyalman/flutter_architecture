// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomFutureWidget extends StatelessWidget {
  final Widget Function(void Function(bool isLoading) setIsLoading) builder;
  final Widget? futureWidget;

  CustomFutureWidget({required this.builder, this.futureWidget});

  final _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (_, value, __) {
        if (value) {
          return futureWidget ??
              const Center(child: CircularProgressIndicator());
        }
        return builder.call(setIsLoading);
      },
    );
  }

  void setIsLoading(bool value) => _isLoading.value = value;
}

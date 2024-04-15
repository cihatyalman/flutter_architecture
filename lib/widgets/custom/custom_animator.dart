// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class CustomAnimator extends StatelessWidget {
  final Map<String, Tween> tweenMap;
  final Widget Function(AnimatorState state, dynamic value) builder;
  final Duration duration;
  final Curve curve;

  CustomAnimator({
    required this.tweenMap,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
  });

  final _animatorKey = AnimatorKey();
  late AnimatorState _animatorState;

  AnimatorState get animatorState => _animatorState;

  @override
  Widget build(BuildContext context) {
    return Animator(
      animatorKey: _animatorKey,
      duration: duration,
      curve: curve,
      cycles: 1,
      tween: tweenMap.values.first,
      tweenMap: tweenMap,
      builder: (_, animatorState, __) {
        _animatorState = animatorState;
        return builder.call(
          _animatorState,
          AlwaysStoppedAnimation(_animatorState.value).value,
        );
      },
    );
  }
}

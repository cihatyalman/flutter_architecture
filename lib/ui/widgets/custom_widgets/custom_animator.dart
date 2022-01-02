// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class CustomAnimator<T> extends StatelessWidget {
  final Tween<T> tween;
  final Widget Function(AnimatorState<T> state, T value) builder;
  final Duration duration;
  final Curve curve;

  CustomAnimator({
    required this.tween,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
  });

  final _animatorKey = AnimatorKey<T>();
  late AnimatorState<T> _animatorState;

  AnimatorState<T> get animatorState => _animatorState;

  @override
  Widget build(BuildContext context) {
    return Animator<T>(
      animatorKey: _animatorKey,
      duration: duration,
      curve: curve,
      cycles: 1,
      tween: tween,
      builder: (_, animatorState, __) {
        _animatorState = animatorState;
        return builder.call(
          _animatorState,
          AlwaysStoppedAnimation<T>(_animatorState.value).value,
        );
      },
    );
  }
}
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class CustomAnimator extends StatelessWidget {
  final Map<String, Tween> tweenMap;
  final void Function(AnimatorKey animatorKey) init;
  final Widget Function(dynamic value, AnimatorState state) builder;
  final Duration duration;
  final Curve curve;

  CustomAnimator({
    super.key,
    required this.tweenMap,
    required this.init,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
  });

  final _animatorKey = AnimatorKey();

  @override
  Widget build(BuildContext context) {
    bool initStatus = false;
    return Animator(
      animatorKey: _animatorKey,
      duration: duration,
      curve: curve,
      cycles: 1,
      tween: tweenMap.values.first,
      tweenMap: tweenMap,
      builder: (_, animatorState, _) {
        if (!initStatus) {
          initStatus = true;
          init(_animatorKey);
        }
        return builder.call(
          AlwaysStoppedAnimation(animatorState.value).value,
          animatorState,
        );
      },
    );
  }
}

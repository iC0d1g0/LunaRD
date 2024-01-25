import 'package:flutter/material.dart';

class TransicionPantalla extends StatelessWidget {
  const TransicionPantalla(
      {super.key,
      required this.child,
      required this.duration,
      required this.offeset});
  final Widget child;
  final num offeset;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      builder: (context, value, child) {
        return Transform.translate(offset: Offset(value * offeset, 0.0));
      },
      child: child,
    );
  }
}

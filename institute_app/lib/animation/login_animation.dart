import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, trans }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
      ..addScene(
        duration: const Duration(milliseconds: 700),
        begin: Duration(milliseconds: 0),
      ).animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
        duration: const Duration(milliseconds: 1000),
        begin: Duration(milliseconds: 0),
      ).animate(AniProps.trans, tween: Tween(begin: -20.0, end: 0.0));

    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(
              0,
              animation.get(AniProps.trans),
            ),
            child: child),
      ),
    );
  }
}

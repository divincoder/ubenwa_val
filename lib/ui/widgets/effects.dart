import 'package:flutter/material.dart';
import 'dart:math' as math;

/*
* Effects - Contains some animation effects that can be used with
* a Number Value Notifier and can be customized later.
*
 */
class SlideEffect extends StatelessWidget {
  final ValueNotifier<double?>? notifier;
  final Widget child;
  final double xOffset;
  final double yOffset;
  final int? page;

  const SlideEffect(
      {Key? key,
      required this.notifier,
      required this.child,
      required this.xOffset,
      required this.page,
      required this.yOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier!,
      builder: (context, anim) {
        var position = (notifier!.value! - notifier!.value!.truncate());
        var offsetX = position * xOffset;

        if (notifier!.value! < page!) {
          offsetX -= xOffset;
        }

        var offsetY = position * yOffset;
        if (notifier!.value! < page!) {
          offsetY -= yOffset;
        } else {
          offsetY *= -1;
        }
        return Transform.translate(
            offset: Offset(offsetX * -1, offsetY * -1), child: child);
      },
    );
  }
}

class RotateEffect extends StatelessWidget {
  final ValueNotifier<double?>? notifier;
  final Widget child;

  const RotateEffect({Key? key, required this.notifier, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier!,
      builder: (context, anim) {
        return Transform.rotate(
          angle: notifier!.value! * math.pi,
          child: child,
          alignment: FractionalOffset.center,
        );
      },
    );
  }
}

class ScaleEffect extends StatelessWidget {
  final ValueNotifier<double?>? notifier;
  final Widget child;
  final int? page;

  const ScaleEffect(
      {Key? key,
      required this.notifier,
      required this.child,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier!,
      builder: (context, anim) {
        var scale = 1 - (notifier!.value! - notifier!.value!.truncate());

        if (notifier!.value! < page!) {
          scale -= 1;
        }

        if (scale < 0) scale *= -1;

        return Transform.scale(
          scale: scale,
          child: child,
          alignment: FractionalOffset.center,
        );
      },
    );
  }
}

class FadeEffect extends StatelessWidget {
  final ValueNotifier<double?>? notifier;
  final Widget child;
  final int? page;

  const FadeEffect(
      {Key? key,
      required this.notifier,
      required this.child,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier!,
      builder: (context, anim) {
        var opacity = 1 - (notifier!.value! - notifier!.value!.truncate());

        if (notifier!.value! < page!) {
          opacity = 1 - opacity;
        }

        return Opacity(opacity: opacity, child: child);
      },
    );
  }
}

class MyFadeIn extends StatefulWidget {
  final Widget child;

  const MyFadeIn({Key? key, required this.child}) : super(key: key);

  @override
  _MyFadeInState createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();  // Start the fade-in on initState.
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }
}
import 'package:flutter/material.dart';

class ProvideAnimation extends StatefulWidget {
  final Widget child;
  final TransitionFormat transitionFormat;
  final Key key;
  final Curve curves;

  ProvideAnimation(
      {this.child,
      this.curves = Curves.easeOut,
      this.transitionFormat = TransitionFormat.bottomToTop,
      this.key})
      : super(key: key);

  @override
  _ProvideAnimationState createState() => _ProvideAnimationState();
}

class _ProvideAnimationState extends State<ProvideAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationHandler();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  void _animationHandler() {
    switch (widget.transitionFormat) {
      case TransitionFormat.topToBottom:
        _animation = Tween<Offset>(
          begin: const Offset(0, -0.5),
          end: Offset.zero,
        ).chain(CurveTween(curve: widget.curves)).animate(_controller)
          ..addListener(() {
            if (mounted) setState(() {});
          });
        break;
      case TransitionFormat.leftToRight:
        _animation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: widget.curves)).animate(_controller)
          ..addListener(() {
            if (mounted) setState(() {});
          });
        break;
      case TransitionFormat.rightToLeft:
        _animation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: widget.curves)).animate(_controller)
          ..addListener(() {
            if (mounted) setState(() {});
          });
        break;
      default:
        _animation = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: widget.curves)).animate(_controller)
          ..addListener(() {
            if (mounted) setState(() {});
          });
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

enum TransitionFormat { topToBottom, bottomToTop, leftToRight, rightToLeft }

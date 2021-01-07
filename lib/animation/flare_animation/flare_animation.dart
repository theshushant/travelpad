import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimation extends StatelessWidget {
  final String animationType;
  final String image;
  final Function callback;

  FlareAnimation(
      {@required this.image,
      this.animationType = "AnimationPrime",
      this.callback});

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      image,
      alignment: Alignment.center,
      fit: BoxFit.contain,
      animation: animationType,
      callback: (data) {
//        callback(context);
      },
    );
  }
}

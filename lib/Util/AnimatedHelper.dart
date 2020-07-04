import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class AnimatedHelper extends BaseStatelessWidget {
  final Animation<double> animation;
  final Widget child;

  AnimatedHelper({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

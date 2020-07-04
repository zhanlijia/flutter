import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/AnimatedHelper.dart';

class AnimationSampleVC extends BaseStatefulWidget {
  @override
  _AnimationSampleVCState createState() {
    // TODO: implement createState
    return _AnimationSampleVCState();
  }
}

class _AnimationSampleVCState extends BasePageViewState<AnimationSampleVC> {
  String title = "动画示例";

  List<PageViewEntity> pages = [
    PageViewEntity(title: "基础动画", pageVC: AnimationBaseVC()),
    PageViewEntity(title: 'AnimatedWidget', pageVC: AnimatedWidgetVC()),
    PageViewEntity(title: "AnimatedBuilder", pageVC: AnimatedBuilderVC())
  ];
}

///基础动画
class AnimationBaseVC extends BaseStatefulWidget {
  @override
  _AnimationBaseVCState createState() {
    // TODO: implement createState
    return _AnimationBaseVCState();
  }
}

///如果有多个AnimationController，应使用TickerProviderStateMixin
class _AnimationBaseVCState extends BaseState<AnimationBaseVC>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
      ..addListener(() {
        setState(() {});
      })..addStatusListener((status) {
        if(status == AnimationStatus.completed){//终点位置停止
          _controller.reverse();//反向执行
        }else if(status == AnimationStatus.dismissed){//起始点停止
          _controller.forward();//正向执行
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Image.asset(
        "./images/avatar.jpg",
        width: _animation.value,
        height: _animation.value,
      ),
    );
  }
}

class SinCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2).abs();
  }
}

///AnimatedWidget
class AnimatedWidgetVC extends BaseStatefulWidget {
  @override
  _AnimatedWidgetVC createState() {
    // TODO: implement createState
    return _AnimatedWidgetVC();
  }
}

class _AnimatedWidgetVC extends BaseState<AnimatedWidgetVC>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "./images/avatar.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

///AnimatedBuilder
class AnimatedBuilderVC extends BaseStatefulWidget {
  @override
  _AnimatedBuilderVCState createState() {
    // TODO: implement createState
    return _AnimatedBuilderVCState();
  }
}

class _AnimatedBuilderVCState extends BaseState<AnimatedBuilderVC>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedHelper(
      animation: animation,
      child: Image.asset("./images/avatar.jpg"),
    );
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("./images/avatar.jpg"),
      builder: (context, widget) {
        return Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: widget,
          ),
        );
      },
    );
  }
}

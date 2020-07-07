import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class AnimatedSwitcherVC extends BaseStatefulWidget {
  @override
  _AnimatedSwitcherVCState createState() {
    // TODO: implement createState
    return _AnimatedSwitcherVCState();
  }
}

class _AnimatedSwitcherVCState extends BaseState<AnimatedSwitcherVC> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画切换组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("同类型view不同key"),
                  //一个child，不同状态切换
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: Text(
                      "$_count",
                      key: ValueKey(_count), //需要指定key，key不同才会执行动画，或者类型不相同
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("不同类型view"),
                  AnimatedSwitcher(
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        child: child,
                        scale: animation,
                      );
                    },
                    duration: Duration(milliseconds: 500),
                    child: _count % 2 == 0
                        ? Text(
                            "$_count",
//                key: ValueKey(_count),
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Image.asset(
                            "./images/avatar.jpg",
                            width: 40,
                          ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("两个view切换"),
                  //两个child切换
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 500),
                    firstChild: Text(
                      "text",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    secondChild: Image.asset(
                      "./images/avatar.jpg",
                      width: 40,
                    ),
                    crossFadeState: _count % 2 == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  )
                ],
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _count % 2 == 0
                    ? Text(
                        "$_count",
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : Image.asset(
                        "./images/avatar.jpg",
                        width: 40,
                      ),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                      child: child,
                      position:
                          Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                              .animate(animation));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("自定义"),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: _count % 2 == 0
                        ? Text(
                            "$_count",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Image.asset(
                            "./images/avatar.jpg",
                            width: 40,
                          ),
                    transitionBuilder: (child, animation) {
                      return SliderTransitionX(
                        child: child,
                        position: animation,
                        direction: AxisDirection.down,
                      );
                    },
                  )
                ],
              ),
              RaisedButton(
                  child: Text("+1"),
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderTransitionX extends AnimatedWidget {
  SliderTransitionX(
      {Key key,
      @required Animation<double> position,
      this.transformHitTests = true,
      this.direction = AxisDirection.down,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween _tween;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

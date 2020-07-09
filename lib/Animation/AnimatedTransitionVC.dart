import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class AnimatedTransitionVC extends BaseStatefulWidget {
  @override
  _AnimatedTransitionVCState createState() {
    // TODO: implement createState
    return _AnimatedTransitionVCState();
  }
}

class _AnimatedTransitionVCState extends BaseState<AnimatedTransitionVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Color _decorationColor = Colors.blue;
    var duration = Duration(seconds: 1);

    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedDecoratedBox1(
                duration: duration,
                decoration: BoxDecoration(color: _decorationColor),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = Colors.red;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox1 extends BaseStatefulWidget {
  AnimatedDecoratedBox1(
      {Key key,
      @required this.decoration,
      this.child,
      this.curve = Curves.linear,
      @required this.duration,
      this.reverseDuration});

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() {
    // TODO: implement createState
    return _AnimatedDecoratedBox1State();
  }
}

class _AnimatedDecoratedBox1State extends BaseState<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  AnimationController get controller => _controller;

  Animation<double> get animation {
    return _animation;
  }

  DecorationTween _tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: widget.duration,
        reverseDuration: widget.reverseDuration,
        vsync: this);
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

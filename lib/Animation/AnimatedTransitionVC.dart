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
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);
  double _padding = 10;
  double _left = 0;
  Alignment _align = Alignment.centerLeft;
  double _height = 100;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedDecoratedBox(
                duration: duration,
                decoration: BoxDecoration(color: _decorationColor),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _padding = 20;
                  });
                },
                child: AnimatedPadding(
                  duration: duration,
                  padding: EdgeInsets.all(_padding),
                  child: Text("AnimatedPadding"),
                ),
              ),
              SizedBox(
                height: 50,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: duration,
                      left: _left,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _left = 100;
                          });
                        },
                        child: Text("AnimatedPositioned"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.grey,
                child: AnimatedAlign(
                  duration: duration,
                  alignment: _align,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _align = Alignment.center;
                      });
                    },
                    child: Text("AnimatedAlign"),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: duration,
                height: _height,
                color: _color,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _height = 150;
                      _color = Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedContainer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedDefaultTextStyle(
                child: GestureDetector(
                  child: Text('hello world'),
                  onTap: () {
                    setState(() {
                      _style = TextStyle(
                          color: Colors.blue,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.blue);
                    });
                  },
                ),
                style: _style,
                duration: duration,
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

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  final BoxDecoration decoration;
  final Widget child;

  AnimatedDecoratedBox(
      {Key key,
      @required this.decoration,
      this.child,
      Curve curve = Curves.linear,
      @required Duration duration})
      : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  @override
  _AnimatedDecoratedBoxState createState() {
    // TODO: implement createState
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends ImplicitlyAnimatedWidgetState<AnimatedDecoratedBox> {
  DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(context) {
    // TODO: implement forEachTween
    _decoration = context(_decoration, widget.decoration, (value) {
      return DecorationTween(begin: value);
    });
  }
}

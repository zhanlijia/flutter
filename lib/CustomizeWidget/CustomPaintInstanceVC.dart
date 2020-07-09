import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/CustomizeWidget/CustomizeWidgetPageVC.dart';
import 'package:testflutter/CustomizeWidget/MakeUpWidgetInstanceVC.dart';

class CustomPaintInstanceVC extends BaseStatefulWidget {
  @override
  _CustomPaintInstanceVCState createState() {
    // TODO: implement createState
    return _CustomPaintInstanceVCState();
  }
}

class _CustomPaintInstanceVCState extends BaseState<CustomPaintInstanceVC>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("自绘实例"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: <Widget>[
                        GradientCircularProgressIndicator(
                          colors: [Colors.blue, Colors.blue],
                          radius: 50,
                          strokeWidth: 3,
                          value: _controller.value,
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.red, Colors.orange],
                          radius: 50,
                          strokeWidth: 3,
                          value: _controller.value,
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.red, Colors.orange, Colors.red],
                          radius: 50,
                          strokeWidth: 5,
                          value: _controller.value,
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.teal, Colors.cyan],
                          radius: 50,
                          strokeWidth: 5,
                          strokeCapRound: true,
                          value: CurvedAnimation(
                                  parent: _controller, curve: Curves.decelerate)
                              .value,
                        ),
                        TurnBox(
                          turns: 1 / 8,
                          child: GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.orange, Colors.red],
                            radius: 50,
                            strokeWidth: 5,
                            strokeCapRound: true,
                            backgroundColor: Colors.red[50],
                            totalAngle: 1.5 * pi,
                            value: CurvedAnimation(
                                    parent: _controller, curve: Curves.ease)
                                .value,
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: GradientCircularProgressIndicator(
                            radius: 50,
                            colors: [Colors.blue[700], Colors.blue[200]],
                            strokeWidth: 3,
                            strokeCapRound: true,
                            backgroundColor: Colors.transparent,
                            value: _controller.value,
                          ),
                        ),
                        GradientCircularProgressIndicator(
                          colors: [
                            Colors.red,
                            Colors.amber,
                            Colors.cyan,
                            Colors.green[200],
                            Colors.blue,
                            Colors.red
                          ],
                          radius: 50,
                          strokeWidth: 5,
                          strokeCapRound: true,
                          value: _controller.value,
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.blue[700], Colors.blue[200]],
                          radius: 100,
                          strokeWidth: 20,
                          value: _controller.value,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: GradientCircularProgressIndicator(
                            radius: 100,
                            colors: [Colors.blue[700], Colors.blue[300]],
                            strokeWidth: 20,
                            value: _controller.value,
                            strokeCapRound: true,
                          ),
                        ),
                        ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: .5,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: SizedBox(
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    radius: 100.0,
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    strokeWidth: 8,
                                    value: _controller.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 104,
                          width: 200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                height: 200,
                                top: 0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    radius: 100,
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    strokeWidth: 8,
                                    value: _controller.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "${(_controller.value * 100).toInt()}%",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.blueGrey),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends BaseStatelessWidget {
  ///粗细
  final double strokeWidth;

  ///圆的半径
  final double radius;

  ///两端是否圆角
  final bool strokeCapRound;

  ///当前进度，取值范围【0.0-1.0】
  final double value;

  ///进度条背景色
  final Color backgroundColor;

  ///进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  ///渐变色数组
  final List<Color> colors;

  ///渐变色终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: colors),
      ),
    );
  }

  GradientCircularProgressIndicator(
      {this.strokeWidth,
      @required this.radius,
      this.strokeCapRound = false,
      this.value,
      this.backgroundColor = const Color(0xffeeeeee),
      this.totalAngle = 2 * pi,
      @required this.colors,
      this.stops});
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;

  final bool strokeCapRound;

  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;

  final double radius;
  final List<double> stops;

  _GradientCircularProgressPainter(
      {this.strokeWidth = 10,
      this.strokeCapRound = false,
      this.value,
      this.backgroundColor = const Color(0xffeeeeee),
      @required this.colors,
      this.total = 2 * pi,
      this.radius,
      this.stops});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2;
    double _value = value ?? 0;
    _value = _value.clamp(0.0, 1.0) * total;
    double _start = 0.0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    //背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    //前景
    if (_value > 0) {
      paint.shader = SweepGradient(
              startAngle: 0.0, endAngle: _value, colors: colors, stops: stops)
          .createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

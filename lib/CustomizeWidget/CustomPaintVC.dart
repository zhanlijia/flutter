import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class CustomPaintVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自绘组件"),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

///不需要每次落子都重绘棋盘，棋盘可抽取为组件，不依赖外部状态，shouldRepaint返回false
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    //白子
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true; //UI不依赖外部状态，返回false，依赖外部状态，判断状态是否改变，改变返回true重绘，否则false
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/BaseWidget.dart';

class ClipVC extends BaseStatelessWidget {
  var avatar = Image.asset(
    "images/avatar.jpg",
    width: 70,
    height: 70,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("裁剪"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar,
            ClipOval(
              child: avatar,
            ),
            ClipRRect(child: avatar, borderRadius: BorderRadius.circular(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                Text('hello world')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text('hello world')
              ],
            ),
            DecoratedBox(
              //裁剪完还是占用原来的大小，layout阶段就决定了，只是绘制裁剪
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(10, 20, 30, 40);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

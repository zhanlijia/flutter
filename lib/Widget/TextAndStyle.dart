import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class TextAndStyle extends BaseStatefulWidget {
  @override
  _TextAndStyleState createState() {
    // TODO: implement createState
    return _TextAndStyleState();
  }
}

class _TextAndStyleState extends BaseState<TextAndStyle> {
  void onTextTap() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Text and style"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "hell world " * 6,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textScaleFactor: 1.5, //fontSize倍数，用于根据系统全局调整
                ),
                Text(
                  "Hello world",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      backgroundColor: Colors.yellow,
                      fontSize: 18,
                      //精确大小，不会根据系统改变
                      height: 1.2,
                      //fontSize的倍数
                      fontFamily: "Courier",
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: " url "),
                  TextSpan(
                    text: "http://www.baidu.com",
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ])),
                Icon(IconData(0xf007,fontFamily: "Medical"),color: Colors.blueAccent,)
              ],
            ),
          ),
        ));
  }
}

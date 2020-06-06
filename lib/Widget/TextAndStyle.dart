import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/IconFontUtil.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Text and style"),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("aaaa"),
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
                  ),
                  IconFontUtil.textspanF007
                ])),
                Icon(
                  IconFontUtil.icondataF007,
                  color: Colors.blueAccent,
                ),
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("aaaa"),
                      Text("bbbb")
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

import '../BaseWidget.dart';

class MyWidgetPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MyWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("life cycle"),
              onPressed: () {
                NavigatorHelper.go2LifeCycle(context);
              },
            ),
            RaisedButton(
              child: Text("State"),
              onPressed: () {
                NavigatorHelper.go2StateManager(context);
              },
            ),
            FlatButton(
              child: Text("Text and style"),
              onPressed: () {
                NavigatorHelper.go2TextAndStyle(context);
              },
            ),
            FlatButton(
              child: Text("Button"),
              onPressed: () {
                NavigatorHelper.go2Button(context);
              },
            ),
            FlatButton(
              child: Text("Image"),
              onPressed: () {
                NavigatorHelper.go2Image(context);
              },
            ),
            FlatButton(onPressed: (){
              NavigatorHelper.go2CheckBox(context);
            },
            child: Text("单选框和复选框"),),
            FlatButton(
              child: Text("输入框"),
              onPressed: (){
                NavigatorHelper.go2TextFieldVC(context);
              },
            ),
            FlatButton(
              child: Text("表单"),
              onPressed: (){
                NavigatorHelper.go2ForumVC(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

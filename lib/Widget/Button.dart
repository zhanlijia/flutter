import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/IconFontUtil.dart';

class Button extends BaseStatefulWidget {
  @override
  _ButtonState createState() {
    // TODO: implement createState
    return _ButtonState();
  }
}

class _ButtonState extends BaseState<Button> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Text("FlatButton"),
                  Icon(
                    IconFontUtil.icondataF007,
                    color: Colors.yellowAccent,
                  )
                ],
              ),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("OutlineButton"),
            ),
            IconButton(
              icon: Icon(
                IconFontUtil.icondataF007,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
            RaisedButton.icon(
                onPressed: () {},
                icon: Icon(
                  IconFontUtil.icondataF007,
                  color: Colors.green,
                ),
                label: Text("RaiseButton")),
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  IconFontUtil.icondataF007,
                  color: Colors.redAccent,
                ),
                label: Text("FlatButton")),
            OutlineButton.icon(
                onPressed: () {},
                icon: Icon(
                  IconFontUtil.icondataF007,
                  color: Colors.greenAccent,
                ),
                label: Text("OutlineButton")),
            FlatButton(
              onPressed: () {},
              color: Colors.blueAccent,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.elliptical(10, 20),
                      left: Radius.elliptical(10, 10))),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.blueAccent,
              highlightColor: Colors.blueAccent[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      )),
    );
  }
}

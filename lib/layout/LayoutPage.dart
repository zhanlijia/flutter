import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class LayoutPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("布局"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("线性布局"),
                onPressed: () {
                  NavigatorHelper.go2LinearLayoutVC(context);
                },
              ),
              FlatButton(
                child: Text("弹性布局"),
                onPressed: (){
                  NavigatorHelper.go2FlexLayoutVC(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

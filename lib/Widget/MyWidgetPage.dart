import 'package:flutter/material.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

import '../BaseWidget.dart';

class MyWidgetPage extends BaseStatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("MyWidget"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("life cycle"),
              onPressed: (){
                NavigatorHelper.go2LifeCycle(context);
              },

            ),
            RaisedButton(
              child: Text("State"),
            onPressed: (){
                NavigatorHelper.go2StateManager(context);
            },)
          ],
        ),
      )
      ,
    );
  }

}

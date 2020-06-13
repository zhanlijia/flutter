import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class ContainerWidgetPage extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("容器组件"),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Padding"),
              onPressed: (){
                NavigatorHelper.go2PaddingVC(context);
              },
            ),
            FlatButton(
              child: Text("尺寸限制类容器"),
              onPressed: (){
                NavigatorHelper.go2ConstraintWidgetVC(context);
              },
            ),
            FlatButton(
              child: Text("装饰容器"),
              onPressed: (){
                NavigatorHelper.go2DecoratedBoxVC(context);
              },
            ),
            FlatButton(
              child: Text("变换"),
              onPressed: (){
                NavigatorHelper.go2TransformVC(context);
              },
            )
          ],
        ),
      )
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

///[Align]子元素只有一个，不能堆叠  [Stack]子元素多个，可以堆叠
///[Align]定位通过比例，然后换算成坐标 [Stack]只能根据四角偏移量
class AlignVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("对齐和相对定位"),
        ),
        body: Container(
          color: Colors.lightGreenAccent,
          child: Column(
            children: <Widget>[
              Container(
//      height: 120,
//      width: 120,
                color: Colors.lightBlueAccent[100],
                child: Align(
                  widthFactor: 2, //缩放因子，子控件宽*widthFactor为align宽，如果为null，占据尽可能多的空间
                  heightFactor: 2, //同上
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,//1的时候Alignment不起作用？？？
                  heightFactor: 2,
                  //原点在widget中心
                  //(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
                  alignment: Alignment(2, 0),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  //原点在左上角
                  //(FractionalOffset.x * childWidth, FractionalOffset.y * childHeight)
                  alignment: FractionalOffset(0.2,0.6),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class TouchEventVC extends BaseStatefulWidget {
  @override
  _TouchEventVCState createState() {
    // TODO: implement createState
    return _TouchEventVCState();
  }
}

class _TouchEventVCState extends BaseState<TouchEventVC> {
  //position 全局坐标，不是当前view坐标
  //delta 两次指针移动事件
  //pressure 按压力度，3D Touch
  //orientation 移动角度值
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指针事件处理"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Listener(
              child: Container(
                width: 300,
                height: 200,
//              color: Colors.blueAccent,
                child: Center(
                    child: Text(
                  "${_event?.toString() ?? ""} "
                  "delta ${_event?.delta ?? Offset.zero} "
                  "orientation ${_event?.orientation ?? 0}",
                  style: TextStyle(
                      color: Colors.red, backgroundColor: Colors.yellow),
                )),
              ),
              onPointerDown: (downEvent) {
                setState(() {
                  _event = downEvent;
                });
              },
              onPointerMove: (moveEvent) {
                setState(() {
                  _event = moveEvent;
                });
              },
              onPointerUp: (upEvent) {
                setState(() {
                  _event = upEvent;
                });
              },
// 当container背景透明时，可响应点击只有Text，加上这个整个Container都可以响应，相当于有了背景不透明，不会向底部widget透传
//            behavior: HitTestBehavior.opaque,
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: Container(
                    color: Colors.blue,
                    height: 300,
                    width: 200,
                  ),
                  onPointerDown: (downEvent) {
                    print("down0");
                  },
                ),
                Listener(
                  child: Container(
                    height: 200,
                    width: 100,
                    child: Center(
                      child: Text("左上角200*100非文本区域点击"),
                    ),
                  ),
                  onPointerDown: (downEvent) {
                    print("down1");
                  },
                  behavior:
                      HitTestBehavior.translucent, //透传向下传递，底部和底部widget都能收到事件
                )
              ],
            ),
            Listener(
              child: AbsorbPointer(
                //本身响应touch事件，子控件不响应事件
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 100,
                  ),
                  onPointerDown: (_) {
                    print("down");
                  },
                ),
              ),
              onPointerUp: (_) {
                print("up");
              },
            ),
            Listener(
              child: IgnorePointer(
                //本身和子控件均不响应touch事件
                child: Listener(
                  child: Container(
                    color: Colors.blue,
                    width: 200,
                    height: 100,
                  ),
                  onPointerDown: (_) {
                    print("down");
                  },
                ),
              ),
              onPointerUp: (_) {
                print("up");
              },
            )
          ],
        ),
      ),
    );
  }
}

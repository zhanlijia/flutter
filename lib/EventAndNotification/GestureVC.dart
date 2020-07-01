import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../BaseWidget.dart';

class GestureVC extends BaseStatefulWidget {
  @override
  _GestureVCState createState() {
    // TODO: implement createState
    return _GestureVCState();
  }
}

class _GestureVCState extends BaseState<GestureVC> {
  int tabIndex = 0;
  List<Widget> pages = [GestureDetectorVC(), GestureRecognizerVC()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.rotate_90_degrees_ccw), title: Text("Detector")),
          BottomNavigationBarItem(
              icon: Icon(Icons.print), title: Text("Recognizer"))
        ],
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        currentIndex: tabIndex,
      ),
      body: pages[tabIndex],
    );
  }
}

class GestureDetectorVC extends BaseStatefulWidget {
  @override
  _GestureDetectorVCState createState() {
    // TODO: implement createState
    return _GestureDetectorVCState();
  }
}

class _GestureDetectorVCState extends BasePageViewState<GestureDetectorVC> {
  List<PageViewEntity> pages = [
    PageViewEntity(title: "点击", pageVC: GestureClickVC()),
    PageViewEntity(title: "拖动", pageVC: DragVC()),
    PageViewEntity(title: "单一方向", pageVC: OrientationDragVC()),
    PageViewEntity(title: "缩放", pageVC: ScaleVC())
  ];
  String title = "Detector";
}

//点击 双击 长按
class GestureClickVC extends BaseStatefulWidget {
  @override
  _GestureClickVCState createState() {
    // TODO: implement createState
    return _GestureClickVCState();
  }
}

class _GestureClickVCState extends BaseState<GestureClickVC> {
  String touchEventRes = "no touch event";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blueAccent,
          height: 200,
          width: 200,
          child: Text(
            touchEventRes,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          //同时监听onTap和onDoubleTap，onTap后会有200ms延时，只监听onTap不会有延时
          updateTouchEventText("on tap");
        },
        onDoubleTap: () {
          updateTouchEventText("on double tap");
        },
        onLongPress: () {
          updateTouchEventText("on long press");
        },
      ),
    );
  }

  updateTouchEventText(String res) {
    setState(() {
      touchEventRes = res;
    });
  }
}

//拖动 滑动
class DragVC extends BaseStatefulWidget {
  @override
  _DragVCState createState() {
    // TODO: implement createState
    return _DragVCState();
  }
}

class _DragVCState extends BaseState<DragVC> {
  double _top = 0;
  double _left = 0;
  String curState = "no state";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Text(curState),
        Positioned(
          left: _left,
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onPanDown: (dragDownDetail) {
              updateStateText("pan down");
            },
            onPanUpdate: (dragUpdateDetail) {
              setState(() {
                _top += dragUpdateDetail.delta.dy;
                _left += dragUpdateDetail.delta.dx;
              });

              updateStateText("${dragUpdateDetail.globalPosition}");
            },
            onPanEnd: (dragEndDetail) {
              updateStateText("pan end ${dragEndDetail.velocity}");
            },
          ),
        ),
      ],
    );
  }

  updateStateText(String res) {
    setState(() {
      curState = res;
    });
  }
}

//单一方向拖动
class OrientationDragVC extends BaseStatefulWidget {
  @override
  _OrientationDragVCState createState() {
    // TODO: implement createState
    return _OrientationDragVCState();
  }
}

class _OrientationDragVCState extends BaseState<OrientationDragVC> {
  double _top = 400;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: 300,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onVerticalDragUpdate: (dragUpdateDetails) {
              setState(() {
                _top += dragUpdateDetails.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

//缩放
class ScaleVC extends BaseStatefulWidget {
  @override
  _ScaleVCState createState() {
    // TODO: implement createState
    return _ScaleVCState();
  }
}

class _ScaleVCState extends BaseState<ScaleVC> {
  double width = 100;

  bool isScale = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Image.asset(
          "./images/avatar.jpg",
          width: width,
        ),
        onScaleUpdate: (scaleUpdate) {
          setState(() {
            width = 100 * scaleUpdate.scale.clamp(0.8, 1.5);
          });
        },
        onDoubleTap: () {
          setState(() {
            width = isScale ? 100 : 200;
            isScale = !isScale;
          });
        },
      ),
    );
  }
}

///Recognizer
class GestureRecognizerVC extends BaseStatefulWidget {
  @override
  _GestureRecognizerVCState createState() {
    // TODO: implement createState
    return _GestureRecognizerVCState();
  }
}

class _GestureRecognizerVCState extends BasePageViewState<GestureRecognizerVC> {
  String title = "Recognizer";
  List<PageViewEntity> pages = [
    PageViewEntity(title: "Recognizer", pageVC: TestRecognizerVC()),
    PageViewEntity(title: "竞争", pageVC: ArenaRecognizerVC()),
    PageViewEntity(title: "冲突", pageVC: GestureConflictVC())
  ];
}

///
class TestRecognizerVC extends BaseStatefulWidget {
  @override
  _TestRecognizerVCState createState() {
    // TODO: implement createState
    return _TestRecognizerVCState();
  }
}

class _TestRecognizerVCState extends BaseState<TestRecognizerVC> {
  TapGestureRecognizer _tapGestureRecognizer;
  bool _toggle = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "hello world"),
        TextSpan(
            text: "点我变色",
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
            style:
                TextStyle(color: _toggle ? Colors.blueGrey : Colors.blueAccent))
      ])),
    );
  }
}

///手势竞争
class ArenaRecognizerVC extends BaseStatefulWidget {
  @override
  _ArenaRecognizerVCState createState() {
    // TODO: implement createState
    return _ArenaRecognizerVCState();
  }
}

class _ArenaRecognizerVCState extends BaseState<ArenaRecognizerVC> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onHorizontalDragUpdate: (dragDetail) {
              setState(() {
                _left += dragDetail.delta.dx;
              });
            },
            onVerticalDragUpdate: (dragDetail) {
              setState(() {
                _top += dragDetail.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

///手势冲突
class GestureConflictVC extends BaseStatefulWidget {
  @override
  _GestureConflictVCState createState() {
    // TODO: implement createState
    return _GestureConflictVCState();
  }
}

class _GestureConflictVCState extends BaseState<GestureConflictVC> {
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          child: Listener(//原始的Down和Up可以监听，onHorizontalDragEnd也没问题
            onPointerDown: (details) {
              print("down");
            },
            onPointerUp: (details) {
              print("up");
            },
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              onHorizontalDragUpdate: (dragDetail) {
                setState(() {
                  _left += dragDetail.delta.dx;
                });
              },
              onHorizontalDragEnd: (endDetail) {
                print('onHorizontalDragEnd');
              },
//            onTapDown: (downDetails) {
//              print("down");
//            },
              //TapUp与onHorizontalDragEnd冲突，滑动时onHorizontalDragEnd胜出，响应onHorizontalDragEnd，不滑动TapUp胜出，响应TapUp
//            onTapUp: (upDetails) {
//              print("up");
//            },
            ),
          ),
        )
      ],
    );
  }
}

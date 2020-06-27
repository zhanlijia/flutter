import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../BaseWidget.dart';
import '../ScrollableWidget/GridViewVC.dart';
import '../ScrollableWidget/GridViewVC.dart';
import '../ScrollableWidget/GridViewVC.dart';
import '../ScrollableWidget/GridViewVC.dart';
import '../ScrollableWidget/GridViewVC.dart';

class GestureVC extends BaseStatefulWidget {
  @override
  _GestureVCState createState() {
    // TODO: implement createState
    return _GestureVCState();
  }
}

class _GestureVCState extends BaseState<GestureVC>
    with SingleTickerProviderStateMixin {
  List<PageEntity> pages = [
    PageEntity(title: "点击", pageVC: GestureClickVC()),
    PageEntity(title: "拖动", pageVC: DragVC()),
    PageEntity(title: "单一方向", pageVC: OrientationDragVC()),
    PageEntity(title: "缩放", pageVC: ScaleVC())
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: pages.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return DragVC();
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
        bottom: TabBar(
            controller: _tabController,
            tabs: pages
                .map((e) => Tab(
                      text: e.title,
                    ))
                .toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: pages.map((e) => e.pageVC).toList(),
      ),
    );
  }
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
  double _top = 300;
  double _left = 300;
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
            width = 100 * scaleUpdate.scale;
          });
        },
        onDoubleTap: (){
          setState(() {
            width = isScale ? 100 : 200;
            isScale = !isScale;
          });

        },
      ),
    );
  }
}

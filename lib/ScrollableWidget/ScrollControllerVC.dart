import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ScrollControllerVC extends BaseStatefulWidget {
  @override
  _ScrollControllerVCState createState() {
    // TODO: implement createState
    return _ScrollControllerVCState();
  }
}

class _ScrollControllerVCState extends BaseState<ScrollControllerVC> {
  ScrollController _scrollController;//只能监听到offset
  bool show2TopBtn = false;

  String progressStr = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      print("scrollController offset $offset  ");

      if (offset < 1000 && show2TopBtn) {
        //加show2TopBtn判断是为了不频繁setState()刷新界面
        setState(() {
          show2TopBtn = false;
        });
      } else if (offset > 1000 && show2TopBtn == false) {
        setState(() {
          show2TopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(//能监听到viewport信息和offset
          onNotification: (ScrollNotification notification) {
            var progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              progressStr = "${(progress * 100).toInt()}%";
            });
            //extentBefore 已滑出viewport的长度
            //extentInside viewport长度
            //extentAfter 未滑入viewport长度
            //atEdge 是否滑到边界（头部 底部）
            print("--- extentAfter ${notification.metrics.extentAfter}");
            return; //false 通知继续冒泡，true 通知不再冒泡
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.access_alarms),
                    title: Text("list item $index"),
                  );
                },
                itemCount: 100,
                itemExtent: 50,
              ),
              CircleAvatar(
                radius: 30,
                child: Text(progressStr),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !show2TopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
            ),
    );
  }
}

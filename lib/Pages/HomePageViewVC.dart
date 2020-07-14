import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Pages/AdvancePageVC.dart';
import 'package:testflutter/Pages/BasicPageVC.dart';
import 'package:testflutter/Pages/DemoPageVC.dart';

class HomePageViewVC extends BaseStatefulWidget {
  @override
  _HomePageViewVC createState() {
    // TODO: implement createState
    return _HomePageViewVC();
  }
}

class _HomePageViewVC extends BaseState<HomePageViewVC> {
  int _curBottomBarSelectedIndex = 1;

  var contentPages = [BasicPageVC(), AdvancePageVC(), DemoPageVC()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: contentPages[_curBottomBarSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curBottomBarSelectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('入门')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('进阶')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("其他"))
        ],
        onTap: (int index) {
          setState(() {
            _curBottomBarSelectedIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/ContainerWidget/PageViewVC.dart';
import 'package:testflutter/ContainerWidget/TabViewVC.dart';

class BottomNavigationBarVC extends BaseStatefulWidget {
  @override
  _BottomNavigationBarVCState createState() {
    // TODO: implement createState
    return _BottomNavigationBarVCState();
  }
}

class _BottomNavigationBarVCState extends BaseState<BottomNavigationBarVC>
    with SingleTickerProviderStateMixin {
  int _curBottomNavigationBarSelectedIndex = 1;

  List pages = [TabViewVC(), PageViewVC()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  MaterialColor getColor(int index) {
    return _curBottomNavigationBarSelectedIndex == index
        ? Colors.blue
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("BottomNavigationBarVC"),
        ),
        body: pages[_curBottomNavigationBarSelectedIndex],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: getBottomAppBar()
//            getBottomNavigationBar()
        );
  }

  getBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 60,
            child: FlatButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: getColor(0),
                  ),
                  Text(
                    "text",
                    style: TextStyle(color: getColor(0)),
                  )
                ],
              ),
              onPressed: () {
                setState(() {
                  _curBottomNavigationBarSelectedIndex = 0;
                });
              },
            ),
          ),
          SizedBox(),
          IconButton(
            icon: Icon(
              Icons.business,
              color: getColor(1),
            ),
            onPressed: () {
              setState(() {
                _curBottomNavigationBarSelectedIndex = 1;
              });
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }

  getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _curBottomNavigationBarSelectedIndex,
      items: [
        BottomNavigationBarItem(title: Text("TabView"), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text("PageView"), icon: Icon(Icons.business)),
      ],
      onTap: (int index) {
        setState(() {
          _curBottomNavigationBarSelectedIndex = index;
        });
      },
    );
  }
}

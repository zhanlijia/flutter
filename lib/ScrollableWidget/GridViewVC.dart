import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

///主界面
class GridViewVC extends BaseStatefulWidget {
  @override
  _GridViewVCState createState() {
    // TODO: implement createState
    return _GridViewVCState();
  }
}

class _GridViewVCState extends BaseState<GridViewVC> {
  int curBottomNavigationItemSelectIndex = 0;

  List<Widget> tabs = [FixedCrossVC(), MaxCrossVC()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: tabs[curBottomNavigationItemSelectIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: curBottomNavigationItemSelectIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.gps_fixed), title: Text("FixedCross")),
            BottomNavigationBarItem(
                title: Text("MaxCross"), icon: Icon(Icons.maximize))
          ],
          onTap: (int index) {
            curBottomNavigationItemSelectIndex = index;
            setState(() {});
          },
        ));
  }
}

class PageEntity {
  String title;
  Widget pageVC;

  PageEntity({this.title, this.pageVC});
}

///tab FixedCross  MaxCross 界面重用
class BaseCrossState<T extends StatefulWidget> extends BaseState
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<PageEntity> pages = [
    PageEntity(title: "Simple", pageVC: GridViewSample()),
    PageEntity(title: "Count", pageVC: GridViewCount()),
    PageEntity(title: "Builder", pageVC: GridViewBuilder())
  ];

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
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
          bottom: TabBar(
            controller: _tabController,
            tabs: pages
                .map((e) => Tab(
                      text: e.title,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: pages.map((e) => e.pageVC).toList(),
        ));
  }
}

///tab FixedCross
class FixedCrossVC extends BaseStatefulWidget {
  @override
  _FixedCrossVCState createState() {
    // TODO: implement createState
    return _FixedCrossVCState();
  }
}

class _FixedCrossVCState extends BaseCrossState<FixedCrossVC> {
  List<PageEntity> pages = [
    PageEntity(title: "Simple", pageVC: GridViewSample()),
    PageEntity(title: "Count", pageVC: GridViewCount()),
    PageEntity(title: "Builder", pageVC: GridViewBuilder())
  ];
}

/// [FixedCrossVC] simple
class GridViewSample extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: <Widget>[
        Container(
          color: Colors.redAccent,
          child: Icon(Icons.ac_unit),
        ),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}

/// [FixedCrossVC] count
class GridViewCount extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}

/// [FixedCrossVC] builder
class GridViewBuilder extends BaseStatefulWidget {
  @override
  _GridViewBuilderState createState() {
    // TODO: implement createState
    return _GridViewBuilderState();
  }
}

class _GridViewBuilderState extends BaseState<GridViewBuilder> {
  List<String> showData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: showData.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          print("index $index");
          if (index == showData.length - 1) {
            if (index - 1 < 100) {
              requestData();
              return UnconstrainedBox(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Text("no more data"),
              );
            }
          }
          return Container(
            color: Colors.lightGreenAccent,
            child: Text(showData[index]),
            alignment: Alignment.center,
          );
        });
  }

  requestData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showData.insertAll(max(0, showData.length - 1),
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

/// tab MaxCross
class MaxCrossVC extends BaseStatefulWidget {
  @override
  _MaxCrossVCState createState() {
    // TODO: implement createState
    return _MaxCrossVCState();
  }
}

class _MaxCrossVCState extends BaseCrossState<MaxCrossVC> {
  @override
  // TODO: implement pages
  List<PageEntity> get pages => [
        PageEntity(title: "Sample", pageVC: MGridViewSimple()),
        PageEntity(title: "extent", pageVC: MGridViewExtent())
      ];
}

/// [MaxCrossVC] simple
class MGridViewSimple extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}

/// [MaxCrossVC] extent
class MGridViewExtent extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 100,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}

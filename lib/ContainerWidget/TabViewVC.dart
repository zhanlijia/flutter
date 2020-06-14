import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/ContainerWidget/BottomNavigationBarVC.dart';

class TabViewVC extends BaseStatefulWidget {
  @override
  _TabViewVCState createState() {
    // TODO: implement createState
    return _TabViewVCState();
  }
}

class _TabViewVCState extends BaseState<TabViewVC>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> tabTitles = ['历史', '地理', '语文'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.addListener(() {
      print("tabController listener ${_tabController.index}");
    });
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
        title: Text("TabView"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabTitles
              .map((e) => Tab(
                    text: e,
                    icon: Icon(Icons.music_note),
                  ))
              .toList(),
        ),
      ),
      endDrawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabTitles
            .map((e) => Container(
                  alignment: Alignment.center,
                  child: Text(e),
                ))
            .toList(),
      ),
    );
  }
}

class MyDrawer extends BaseStatelessWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset(
                          "images/preset_abdomen.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('manage accounts'),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

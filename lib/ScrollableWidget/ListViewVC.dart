import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ListViewVC extends BaseStatefulWidget {
  @override
  _ListViewVCState createState() {
    // TODO: implement createState
    return _ListViewVCState();
  }
}

class _ListViewVCState extends BaseState<ListViewVC>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var contentPages = [
    TabPageEntity(title: "Simple", vc: SimpleListViewVC()),
    TabPageEntity(title: "Builder", vc: ListViewWithBuilder()),
    TabPageEntity(title: "Separated", vc: ListViewWithSeparated())
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
        initialIndex: 0, length: contentPages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        bottom: TabBar(
          controller: _tabController,
          tabs: contentPages
              .map((e) => Tab(
                    text: e.title,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: contentPages.map((e) => e.vc).toList(),
      ),
    );
  }
}

class TabPageEntity {
  String title;
  Widget vc;

  TabPageEntity({this.title, this.vc});
}

///跟SingleChildScrollerView一样没有懒加载
class SimpleListViewVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(15),
      children: <Widget>[
        Text("item0"),
        Text("item1"),
        Text("item2"),
        Text("item3"),
      ],
    );
  }
}

class ListViewWithBuilder extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return Text('item$index');
        });
  }
}

class ListViewWithSeparated extends BaseStatefulWidget {
  @override
  _ListViewWithSeparatedState createState() {
    // TODO: implement createState
    return _ListViewWithSeparatedState();
  }
}

class _ListViewWithSeparatedState extends BaseState<ListViewWithSeparated>
    with AutomaticKeepAliveClientMixin {
  static String loadingTag = "##loading##";
  var content = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    Widget dividerBlue = Divider(
      color: Colors.blueAccent,
    );
    Widget dividerRed = Divider(
      color: Colors.redAccent,
    );

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.redAccent))),
          child: ListTile(
            title: Text("title"),
          ),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            itemBuilder: (BuildContext context, int index) {
              if (content[index] == loadingTag) {
                if (content.length - 1 < 100) {
                  requestData();
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.yellow,
                      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Text("no more data"),
                  );
                }
              }
              return ListTile(title: Text(content[index]));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? dividerBlue : dividerRed;
            },
            itemCount: content.length,
          ),
        )
      ],
    );
  }

  Future requestData() {
    return Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      setState(() {
        content.insertAll(content.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

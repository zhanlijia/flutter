import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("+++ $this initState");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("+++ $this reassemble");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("+++ $this deactivate");
  }

  @override
  void didUpdateWidget(T oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("+++ $this didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("+++ $this didChangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("+++ $this dispose");
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key key}) : super(key: key) {
    print("+++ $this init");
  }
}

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({Key key}) : super(key: key) {
    print("+++ $this init");
  }
}

class PageViewEntity {
  String title;
  Widget pageVC;

  PageViewEntity({this.title, this.pageVC});
}

class BasePageViewState<T extends StatefulWidget> extends BaseState<T>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<PageViewEntity> pages = [];

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

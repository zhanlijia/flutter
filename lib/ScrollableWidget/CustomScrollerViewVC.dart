import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class CustomScrollViewVC extends BaseStatefulWidget {
  @override
  _CustomScrollViewVCState createState() {
    // TODO: implement createState
    return _CustomScrollViewVCState();
  }
}

class _CustomScrollViewVCState extends BaseState<CustomScrollViewVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,//滑动是否一致显示导航栏
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
              background: Image.asset(
                "./images/avatar.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4,mainAxisSpacing: 5,crossAxisSpacing: 5),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text("Grid item $index"),
                );
              }, childCount: 20),
            ),
          ),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
            return Container(
              color: Colors.lightBlue[100 * (index % 9)],
              alignment: Alignment.center,
              child: Text("List item $index"),
            );
          },childCount: 20), itemExtent: 50)
        ],
      ),
    );
  }
}

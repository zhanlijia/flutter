import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ColorAndThemeVC extends BaseStatefulWidget {
  @override
  _ColorAndThemeVCState createState() {
    // TODO: implement createState
    return _ColorAndThemeVCState();
  }
}

class _ColorAndThemeVCState extends BaseState {
  var selectIndex = 0;
  var pages = [ColorVC(), ThemeVC()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens), title: Text("颜色")),
          BottomNavigationBarItem(icon: Icon(Icons.pages), title: Text("主题"))
        ],
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
      ),
    );
  }
}

class ColorVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("颜色"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: NavBar(color: Colors.blueAccent, title: "标题"),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: NavBar(
              color: Colors.greenAccent,
              title: "标题",
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends BaseStatelessWidget {
  final Color color;
  final String title;

  NavBar({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: 44, minWidth: double.infinity),
          decoration: BoxDecoration(color: color, boxShadow: [
            BoxShadow(
                offset: Offset(0, 3), blurRadius: 2, color: Colors.black26)
          ]),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white, //computeLuminance越大颜色越浅
            ),
          ),
        );
      },
    );
  }
}

class ThemeVC extends BaseStatefulWidget {
  @override
  _ThemeVCState createState() {
    // TODO: implement createState
    return _ThemeVCState();
  }
}

class _ThemeVCState extends BaseState {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    ThemeData _themeData = Theme.of(context);

    return Theme(
        data: ThemeData(
            primarySwatch: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          appBar: AppBar(
            title: Text("主题"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.monetization_on),
                  Icon(Icons.home),
                  Icon(Icons.child_care),
                  Text("颜色跟随主题")
                ],
              ),
              Theme(
                  data: _themeData.copyWith(
                    iconTheme:
                        _themeData.iconTheme.copyWith(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      Icon(Icons.home),
                      Icon(Icons.child_care),
                      Text("颜色固定黑色")
                    ],
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.palette),
            onPressed: () {
              setState(() {
                _themeColor =
                    _themeColor == Colors.teal ? Colors.yellow : Colors.teal;
              });
            },
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/Constant/RouteConstant.dart';
import 'package:testflutter/Widget/Button.dart';
import 'package:testflutter/Widget/CheckBoxVC.dart';
import 'package:testflutter/Widget/ForumVC.dart';
import 'package:testflutter/Widget/ProgressIndicatorVC.dart';
import 'package:testflutter/Widget/TextFieldVC.dart';
import 'package:testflutter/Widget/ImageVC.dart';
import 'package:testflutter/Widget/LifeCycleOfWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';
import 'package:testflutter/Widget/MyWidgetPage.dart';
import 'package:testflutter/Widget/TextAndStyle.dart';
import 'package:testflutter/Widget/WidgetStateManager.dart';
import 'package:testflutter/layout/LayoutPage.dart';
import 'package:testflutter/layout/LinearLayoutVC.dart';

import 'BaseWidget.dart';
import 'NewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends BaseStatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    testAsync();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
//          RouteConstant.NewPage : (context){return NewPage(content: ModalRoute.of(context).settings.arguments);},
        "/": (context) {
//          return MyHomePage(title: "Flutter Demo Home Page~~~~");
//          return MyWidgetPage();
          return LayoutPage();
        }
      },
      onGenerateRoute: (routeSettigns) {
        print("---- onGenerateRoute");
        var routeName = routeSettigns.name;
        print(routeName);
        switch (routeName) {
          case RouteConstant.NewPage:
            return CupertinoPageRoute(builder: (context) {
              return NewPage(content: routeSettigns.arguments);
            });
          case RouteConstant.WidgetLifeCycle: //widget生命周期
            return MaterialPageRoute(builder: (context) {
              return LifeCycleOfWidget(
                initValue: 1,
              );
            });
            break;
          case RouteConstant.StateManager: //widget state
            return MaterialPageRoute(builder: (context) {
              return WidgetStateManager();
            });
            break;
          case RouteConstant.TextAndFont: //文本、样式
            return MaterialPageRoute(builder: (context) {
              return TextAndStyle();
            });
            break;
          case RouteConstant.Button: //按钮
            return MaterialPageRoute(builder: (context) {
              return Button();
            });
          case RouteConstant.Image: //图片
            return MaterialPageRoute(builder: (context) {
              return ImageVC();
            });
          case RouteConstant.CheckBox: //单选框 复选框
            return MaterialPageRoute(builder: (context) {
              return CheckBoxVC();
            });
          case RouteConstant.TextField: //输入框
            return MaterialPageRoute(builder: (context) {
              return TextFieldVC();
            });
          case RouteConstant.Forum: //表单
            return MaterialPageRoute(builder: (context) {
              return ForumVC();
            });
          case RouteConstant.ProgressIndicator: //进度条
            return MaterialPageRoute(builder: (context) {
              return ProgressIndicatorVC();
            });
          case RouteConstant.LinearLayout://线性布局
            return MaterialPageRoute(builder: (context){
              return LinearLayoutVC();
            });
          default:
            return null;
        }

        return null;
      },
      navigatorObservers: [],

//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  Future<String> a() async {
    return "";
  }

  Future<String> printData(int i) {
    return Future.delayed(Duration(seconds: 2), () {
      return "$i";
    });
  }

  void testAsync() async {
    for (var i = 0; i < 5; i++) {
      printData(i).then((value) => print(value));
    }
  }
}

class MyHomePage extends BaseStatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  int _counter = 0;
  String _backRes = "";

  void _refreshBackRes(String value) {
    setState(() {
      print("route back");
      _backRes = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text("res $_backRes"),
            FlatButton(
              child: Text("open new page"),
              onPressed: () {
                NavigatorHelper.go2NewPage(context, "another pass value").then(
                    (value) {
                  _refreshBackRes("value");
                }, onError: (e) {});

//                  Navigator.push(context, MaterialPageRoute(builder: (context){
//                      return NewPage(content: "test flutter");
//                  },maintainState: true)).then((value){
//                      _refreshBackRes(value);
//                  },onError: (e){
//
//                  });
              },
              textColor: Colors.lightBlueAccent,
            ),
            FlatButton(
              child: Text("life cycle"),
              onPressed: () {
                NavigatorHelper.go2LifeCycle(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

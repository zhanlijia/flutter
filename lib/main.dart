import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testflutter/Animation/AnimatedTransitionVC.dart';
import 'package:testflutter/Animation/AnimationPageVC.dart';
import 'package:testflutter/Animation/AnimationSampleVC.dart';
import 'package:testflutter/Animation/AnimationSwitcherVC.dart';
import 'package:testflutter/Animation/PageRouteAnimationVC.dart';
import 'package:testflutter/Animation/StaggerAnimationVC.dart';
import 'package:testflutter/Constant/RouteConstant.dart';
import 'package:testflutter/ContainerWidget/ClipVC.dart';
import 'package:testflutter/ContainerWidget/ConstraintVC.dart';
import 'package:testflutter/ContainerWidget/ContainerVC.dart';
import 'package:testflutter/ContainerWidget/ContainerWidgetPage.dart';
import 'package:testflutter/ContainerWidget/DecoratedBoxVC.dart';
import 'package:testflutter/ContainerWidget/PaddingVC.dart';
import 'package:testflutter/ContainerWidget/BottomNavigationBarVC.dart';
import 'package:testflutter/ContainerWidget/TransformVC.dart';
import 'package:testflutter/CustomizeWidget/CustomPaintInstanceVC.dart';
import 'package:testflutter/CustomizeWidget/CustomPaintVC.dart';
import 'package:testflutter/CustomizeWidget/CustomizeWidgetPageVC.dart';
import 'package:testflutter/EventAndNotification/EventAndNotificationPageVC.dart';
import 'package:testflutter/EventAndNotification/GestureVC.dart';
import 'package:testflutter/EventAndNotification/NotificationVC.dart';
import 'package:testflutter/EventAndNotification/TouchEventVC.dart';
import 'package:testflutter/FileAndNetwork/FileAndNetworkPageVC.dart';
import 'package:testflutter/FileAndNetwork/FileVC.dart';
import 'package:testflutter/FileAndNetwork/HttpClientVC.dart';
import 'package:testflutter/FileAndNetwork/HttpDioDownloadRangeVC.dart';
import 'package:testflutter/FileAndNetwork/HttpDioVC.dart';
import 'package:testflutter/FileAndNetwork/JsonAndModelVC.dart';
import 'package:testflutter/FileAndNetwork/SocketVC.dart';
import 'package:testflutter/FileAndNetwork/WebSocketVC.dart';
import 'package:testflutter/FunctionWidget/AsyncUIVC.dart';
import 'package:testflutter/FunctionWidget/ColorAndThemeVC.dart';
import 'package:testflutter/FunctionWidget/DialogVC.dart';
import 'package:testflutter/FunctionWidget/FunctionWidgetPageVC.dart';
import 'package:testflutter/FunctionWidget/InheritedWidgetVC.dart';
import 'package:testflutter/FunctionWidget/ProviderVC.dart';
import 'package:testflutter/FunctionWidget/WillPopScopeVC.dart';
import 'package:testflutter/Localizations/IntlVC.dart';
import 'package:testflutter/Localizations/LocalizationsPageVC.dart';
import 'package:testflutter/Localizations/LocalizationDelegateVC.dart';
import 'package:testflutter/Other/DragListViewVC.dart';
import 'package:testflutter/Pages/HomePageViewVC.dart';
import 'package:testflutter/ScrollableWidget/CustomScrollerViewVC.dart';
import 'package:testflutter/ScrollableWidget/GridViewVC.dart';
import 'package:testflutter/ScrollableWidget/ListViewVC.dart';
import 'package:testflutter/ScrollableWidget/ScrollControllerVC.dart';
import 'package:testflutter/ScrollableWidget/ScrollableWidgetPage.dart';
import 'package:testflutter/ScrollableWidget/SingleChildScrollerViewVC.dart';
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
import 'package:testflutter/l10n/IntlHelper.dart';
import 'package:testflutter/layout/AlignVC.dart';
import 'package:testflutter/layout/FlexLayoutVC.dart';
import 'package:testflutter/layout/LayoutPage.dart';
import 'package:testflutter/layout/LinearLayoutVC.dart';
import 'package:testflutter/layout/StackLayoutVC.dart';
import 'package:testflutter/layout/WrapFlowLayoutVC.dart';

import 'BaseWidget.dart';
import 'Constant/RouteConstant.dart';
import 'CustomizeWidget/MakeUpWidgetInstanceVC.dart';
import 'CustomizeWidget/MakeUpWidgetVC.dart';
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
//          return LayoutPage();
//          return ContainerWidgetPage();
          return HomePageViewVC();
        }
      },
      onGenerateRoute: (routeSettings) {
        print("---- onGenerateRoute");
        var routeName = routeSettings.name;
        print(routeName);
        switch (routeName) {
          case RouteConstant.LalaZhazha:
            return MaterialPageRoute(builder: (context) {
              return MyHomePage(
                title: "",
              );
            });
          case RouteConstant.NewPage:
            return CupertinoPageRoute(builder: (context) {
              return NewPage(content: routeSettings.arguments);
            });
          case RouteConstant.WidgetPage: //基础控件
            return MaterialPageRoute(builder: (context) {
              return MyWidgetPage();
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
          case RouteConstant.Layout: //布局类组件
            return MaterialPageRoute(builder: (context) {
              return LayoutPage();
            });
          case RouteConstant.LinearLayout: //线性布局
            return MaterialPageRoute(builder: (context) {
              return LinearLayoutVC();
            });
          case RouteConstant.FlexLayout: //弹性布局
            return MaterialPageRoute(builder: (context) {
              return FlexLayoutVC();
            });
          case RouteConstant.WrapFlowLayout: //流式布局
            return MaterialPageRoute(builder: (context) {
              return WrapFlowLayoutVC();
            });
          case RouteConstant.StackLayout: //层叠布局
            return MaterialPageRoute(builder: (context) {
              return StackLayoutVC();
            });
          case RouteConstant.AlignLayout: //对齐和相对定位
            return MaterialPageRoute(builder: (context) {
              return AlignVC();
            });
          case RouteConstant.ContainerWidget: //容器类组件
            return MaterialPageRoute(builder: (context) {
              return ContainerWidgetPage();
            });
          case RouteConstant.Padding: //Padding
            return MaterialPageRoute(builder: (context) {
              return PaddingVC();
            });
          case RouteConstant.ConstraintWidget: //尺寸限制类容器
            return MaterialPageRoute(builder: (context) {
              return ConstraintVC();
            });
          case RouteConstant.DecoratedBox: //装饰容器
            return MaterialPageRoute(builder: (context) {
              return DecoratedBoxVC();
            });
          case RouteConstant.Transform: //变换
            return MaterialPageRoute(builder: (context) {
              return TransformVC();
            });
          case RouteConstant.Container: //容器
            return MaterialPageRoute(builder: (context) {
              return ContainerVC();
            });
          case RouteConstant.BottomNavigationBarVC: //BottomNavigationBarVC
            return MaterialPageRoute(builder: (context) {
              return BottomNavigationBarVC();
            });
          case RouteConstant.Clip: //裁剪
            return MaterialPageRoute(builder: (context) {
              return ClipVC();
            });
          case RouteConstant.ScrollableWidget: //ScrollableWidget
            return MaterialPageRoute(builder: (context) {
              return ScrollableWidgetPage();
            });
          case RouteConstant.SingleChildScrollerView: //SingleChildScrollerView
            return MaterialPageRoute(builder: (context) {
              return SingleChildScrollerViewVC();
            });
          case RouteConstant.ListView: //ListView
            return MaterialPageRoute(builder: (context) {
              return ListViewVC();
            });
          case RouteConstant.GridView: //GridView
            return MaterialPageRoute(builder: (context) {
              return GridViewVC();
            });
          case RouteConstant.CustomScrollerView: //CustomScrollerView
            return MaterialPageRoute(builder: (context) {
              return CustomScrollViewVC();
            });
          case RouteConstant.ScrollController: //ScrollController
            return MaterialPageRoute(builder: (context) {
              return ScrollControllerVC();
            });
          case RouteConstant.FunctionWidget: //功能性组件
            return MaterialPageRoute(builder: (context) {
              return FunctionWidgetPageVC();
            });
          case RouteConstant.WillPopScope: //导航返回拦截
            return MaterialPageRoute(builder: (context) {
              return WillPopScopeVC();
            });
          case RouteConstant.InheritedWidget: //数据共享
            return MaterialPageRoute(builder: (context) {
              return InheritedWidgetVC();
            });
          case RouteConstant.Provider: //跨组件数据共享
            return MaterialPageRoute(builder: (context) {
              return ProviderVC();
            });
          case RouteConstant.ColorAndTheme: //颜色和主题
            return MaterialPageRoute(builder: (context) {
              return ColorAndThemeVC();
            });
          case RouteConstant.AsyncUI: //异步UI更新
            return MaterialPageRoute(builder: (context) {
              return AsyncUIVC();
            });
          case RouteConstant.Dialog: //对话框
            return MaterialPageRoute(builder: (context) {
              return DialogVC();
            });
          case RouteConstant.EventAndNotification: //事件处理与通知
            return MaterialPageRoute(builder: (context) {
              return EventAndNotificationPageVC();
            });
          case RouteConstant.TouchEvent: //原始指针事件处理
            return MaterialPageRoute(builder: (context) {
              return TouchEventVC();
            });
          case RouteConstant.Gesture: //手势识别
            return MaterialPageRoute(builder: (context) {
              return GestureVC();
            });
          case RouteConstant.Notification: //通知
            return MaterialPageRoute(builder: (context) {
              return NotificationVC();
            });
          case RouteConstant.AnimationPage: //动画
            return MaterialPageRoute(builder: (context) {
              return AnimationPageVC();
            });
          case RouteConstant.AnimationSample: //动画示例
            return MaterialPageRoute(builder: (context) {
              return AnimationSampleVC();
            });
          case RouteConstant.PageRouteAnimation: //路由过渡动画
            return MaterialPageRoute(builder: (context) {
              return PageRouteAnimationVC();
            });
          case RouteConstant.StaggerAnimation: //交织动画
            return MaterialPageRoute(builder: (context) {
              return StaggerAnimationVC();
            });
          case RouteConstant.AnimatedSwitcher: //动画切换组件
            return MaterialPageRoute(builder: (context) {
              return AnimatedSwitcherVC();
            });
          case RouteConstant.AnimatedTransition: //动画过渡组件
            return MaterialPageRoute(builder: (context) {
              return AnimatedTransitionVC();
            });
          case RouteConstant.CustomizeWidget: //自定义组件
            return MaterialPageRoute(builder: (context) {
              return CustomizeWidgetPageVC();
            });
          case RouteConstant.MakeUpWidget: //组合组件
            return MaterialPageRoute(builder: (context) {
              return MakeUpWidgetVC();
            });
          case RouteConstant.MakeUpWidgetInstance: //组合实例
            return MaterialPageRoute(builder: (context) {
              return MakeUpWidgetInstanceVC();
            });
          case RouteConstant.CustomPaint: //自绘组件
            return MaterialPageRoute(builder: (context) {
              return CustomPaintVC();
            });
          case RouteConstant.CustomPaintInstance: //自绘实例
            return MaterialPageRoute(builder: (context) {
              return CustomPaintInstanceVC();
            });
          case RouteConstant.FileAndNetwork: //文件操作和网络请求
            return MaterialPageRoute(builder: (context) {
              return FileAndNetworkPageVC();
            });
          case RouteConstant.File: //文件操作
            return MaterialPageRoute(builder: (context) {
              return FileVC();
            });
          case RouteConstant.HttpClient: //HttpClient
            return MaterialPageRoute(builder: (context) {
              return HttpClientVC();
            });
          case RouteConstant.HttpDio: //HttpDio
            return MaterialPageRoute(builder: (context) {
              return HttpDioVC();
            });
          case RouteConstant.HttpDioDownloadRange: //Http分块下载
            return MaterialPageRoute(builder: (context) {
              return HttpDioDownloadRangeVC();
            });
          case RouteConstant.WebSocket: //WebSocket
            return MaterialPageRoute(builder: (context) {
              return WebSocketVC();
            });
          case RouteConstant.Socket: //Socket
            return MaterialPageRoute(builder: (context) {
              return SocketVC();
            });
          case RouteConstant.JsonAndModel: //Json  Model
            return MaterialPageRoute(builder: (context) {
              return JsonAndModelVC();
            });
          case RouteConstant.LocalizationPage: //国际化
            return MaterialPageRoute(builder: (context) {
              return LocalizationsPageVC();
            });
          case RouteConstant.LocalizationDelegate: //Localizations
            return MaterialPageRoute(builder: (context) {
              return LocalizationsDelegateVC();
            });
          case RouteConstant.IntlVC: //Intl
            return MaterialPageRoute(builder: (context) {
              return IntlVC();
            });
          case RouteConstant.DragListView: //拖动排序
            return MaterialPageRoute(builder: (context) {
              return DragListViewVC();
            });
          default:
            return null;
        }

        return null;
      },
      navigatorObservers: [],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalizationsTestDelegate(),
        IntlLocalizationsDelegate()
      ],
//      onGenerateTitle: (context){
//        return IntlLocalizations.of(context).title;
//      },
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

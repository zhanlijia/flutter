import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class InheritedWidgetVC extends BaseStatefulWidget {
  @override
  _InheritedWidgetVCState createState() {
    // TODO: implement createState
    return _InheritedWidgetVCState();
  }
}

class _InheritedWidgetVCState extends BaseState<InheritedWidgetVC> {
  int clickCount = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享"),
      ),
      body: ShareDataWidget(
        data: clickCount,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TestShareWidget(),
              FlatButton(
                child: Text("increase"),
                onPressed: () {
                  setState(() {
                    clickCount++;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        ShareDataWidget>(); //注册依赖关系，当InheritedWidget变化，会更新依赖他的子孙组件
//  return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;//没有注册依赖关系
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
//  return true;
  }
}

class TestShareWidget extends BaseStatefulWidget {
  @override
  _TestShareWidgetState createState() {
    // TODO: implement createState
    return _TestShareWidgetState();
  }
}

class _TestShareWidgetState extends BaseState<TestShareWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(builder: (context) {
      return Text(ShareDataWidget.of(context).data.toString());
      return Text("1");
    });
  }
}

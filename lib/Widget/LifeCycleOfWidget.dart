import 'package:flutter/material.dart';

import '../BaseWidget.dart';

class LifeCycleOfWidget extends BaseStatefulWidget {
  final int initValue;

  LifeCycleOfWidget({Key key, this.initValue}):super(key:key);

  @override
  _LifeCycleOfWidgetState createState() {
    return _LifeCycleOfWidgetState();
  }
}

class _LifeCycleOfWidgetState extends BaseState<LifeCycleOfWidget> {
  int _clickNum;

  @override
  void initState() {
    //初始化，只会调用一次
    // TODO: implement initState
    super.initState();
    _clickNum = widget.initValue;

    print("--- initState");
  }

  @override
  void didChangeDependencies() {
    //state依赖发生变化
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("--- didChangeDependencies");
  }

  @override
  void didUpdateWidget(LifeCycleOfWidget oldWidget) {
    //更新
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("--- didUpdateWidget");
  }

  @override
  void reassemble() {
    //hot reload 调用，release模式不会调用
    // TODO: implement reassemble
    super.reassemble();
    print("--- reassemble");
  }

  @override
  void deactivate() {
    //从widget树移除调用
    // TODO: implement deactivate
    super.deactivate();
    print("--- deactivate");
  }

  @override
  void dispose() {
    //永久移除，释放资源
    // TODO: implement dispose
    super.dispose();
    print("--- dispose");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("--- build");
    return Scaffold(
      appBar: AppBar(title: Text('life cycle')),
      body: Center(
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('$_clickNum'),
                textColor: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    ++_clickNum;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                showSnackBarWithOfContext(context);

//                  showSnackBarWidthAncestorStateOfType(context);
                },
                child: Text('show snack bar'),
              )
            ],
          );
        }),
      ),
    );
  }

  void showSnackBarWithOfContext(BuildContext context) {
    ScaffoldState _state = Scaffold.of(context);
    _state.showSnackBar(SnackBar(
      content: Text("snack bar"),
    ));
  }

  void showSnackBarWidthAncestorStateOfType(BuildContext context) {
    ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
    _state.showSnackBar(SnackBar(content: Text("snack bar")));
  }

  void showSnackBarWidthGlobalKey(BuildContext context){

  }
}

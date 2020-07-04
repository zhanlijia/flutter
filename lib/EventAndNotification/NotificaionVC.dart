import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class NotificationVC extends BaseStatefulWidget {
  @override
  _NotificationVCState createState() {
    // TODO: implement createState
    return _NotificationVCState();
  }
}

class _NotificationVCState extends BaseState<NotificationVC> {
  String content = "";
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),
      ),
      body: NotificationListener(
        //只有context以上的NotificationListener才能监听和拦截，要用具体子view的context dispatch通知
        onNotification: (notification) {
//          updateContentText("$notification");
          String log = "outer $notification";
          updateContentText(log);
          print(log);
          return true;
        },
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(content),
            ),
            NotificationListener(
              onNotification: (notification) {
                String log = "inner $notification";
                updateContentText(log);
                print(log);
                return false; //阻止冒泡，父节点收不到该通知，false反之
              },
              child: Builder(builder: (context) {
                return RaisedButton(
                  child: Text("custom notification"),
                  onPressed: () {
                    CustomNotification(msg: "${count++}").dispatch(context);
                  },
                );
              }),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("item $index"),
                );
              },
              itemCount: 30,
            ))
          ],
        ),
      ),
    );
  }

  updateContentText(String content) {
    setState(() {
      this.content = content;
    });
  }
}

class CustomNotification extends Notification {
  CustomNotification({this.msg});

  final String msg;

  @override
  String toString() {
    return 'CustomNotification{msg: $msg}';
  }
}

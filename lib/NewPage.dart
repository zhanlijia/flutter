import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/RandomWord.dart';

class NewPage extends BaseStatefulWidget{

  NewPage({Key key,this.content}):super(key:key);
  final String content;

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends BaseState<NewPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var passValue = ModalRoute.of(context).settings.arguments;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("new page"),),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello world"),
            Text(widget.content),
            Text(passValue ?? "nil"),
            CupertinoButton(
              onPressed: (){
                Navigator.pop(context,"$_count");
              },
              child: Text("back"),
            ),
            RandomWord()
          ],),
      ),
    );
  }
}
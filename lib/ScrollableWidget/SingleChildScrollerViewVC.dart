import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

///[SingleChildScrollView]只应在期望的内容不会超过屏幕太多时使用,因为没有Sliver延迟加载，性能差
class SingleChildScrollerViewVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {

    var titles = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollerView'),),
      body: Scrollbar(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),//BouncingScrollPhysics
          reverse: false,
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: titles.split("").map((e) => Text(e,textScaleFactor: 2,)).toList(),
            ),
          ),
        ),
      )
      ,
    );
  }

}
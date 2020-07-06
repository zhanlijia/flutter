import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class PageRouteAnimationVC extends BaseStatefulWidget {
  @override
  _PageRouteAnimationVCState createState() {
    // TODO: implement createState
    return _PageRouteAnimationVCState();
  }
}

class _PageRouteAnimationVCState extends BaseState<PageRouteAnimationVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由过渡动画"),
      ),
    );
  }
}

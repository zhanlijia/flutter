import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class HeroAnimationVC extends BaseStatefulWidget {
  @override
  _HeroAnimationVCState createState() {
    // TODO: implement createState
    return _HeroAnimationVCState();
  }
}

class _HeroAnimationVCState extends BaseState<HeroAnimationVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(tag: "avatar", child: Image.asset("./images/avatar.jpg")),
    );
  }
}

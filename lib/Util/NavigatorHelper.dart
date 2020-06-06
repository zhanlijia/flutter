import 'package:flutter/material.dart';
import 'package:testflutter/Constant/RouteConstant.dart';

class NavigatorHelper {
  ///
  static Future go2NewPage(BuildContext context, String content) {
    return Navigator.pushNamed(context, RouteConstant.NewPage,
        arguments: content);
  }

  ///widget 生命周期
  static Future go2LifeCycle(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.WidgetLifeCycle);
  }

  ///state管理
  static Future go2StateManager(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.StateManager);
  }

  ///文本、样式
  static Future go2TextAndStyle(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.TextAndFont);
  }

  ///按钮
  static Future go2Button(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.Button);
  }

  ///图片
  static Future go2Image(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.Image);
  }

  ///单选框和复选框
  static Future go2CheckBox(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.CheckBox);
  }

  ///输入框
  static Future go2TextFieldVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.TextField);
  }

  ///表单
  static Future go2ForumVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.Forum);
  }

  ///进度条
  static Future go2ProgressIndicator(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.ProgressIndicator);
  }
}

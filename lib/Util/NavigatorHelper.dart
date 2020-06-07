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

  ///线性布局
  static Future go2LinearLayoutVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.LinearLayout);
  }

  ///弹性布局
  static Future go2FlexLayoutVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.FlexLayout);
  }

  ///流式布局
  static Future go2WrapFlowLayoutVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.WrapFlowLayout);
  }

  ///层叠布局
  static Future go2StackLayoutVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.StackLayout);
  }

  ///对齐和相对布局
  static Future go2AlignLayoutVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.AlignLayout);
  }

  ///padding
  static Future go2PaddingVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.Padding);
  }

  ///尺寸限制类容器
  static Future go2ConstraintWidgetVC(BuildContext context){
    return Navigator.pushNamed(context, RouteConstant.ConstraintWidget);
  }
}

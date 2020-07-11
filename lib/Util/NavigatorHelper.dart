
import 'package:flutter/material.dart';
import 'package:testflutter/Constant/RouteConstant.dart';

import '../Constant/RouteConstant.dart';

class NavigatorHelper {
  static Future go2LalaZhaZha(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.LalaZhazha);
  }

  ///
  static Future go2NewPage(BuildContext context, String content) {
    return Navigator.pushNamed(context, RouteConstant.NewPage,
        arguments: content);
  }

  ///基础控件
  static Future go2WidgetPage(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.WidgetPage);
  }

  ///widget 生命周期
  static Future go2LifeCycle(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.WidgetLifeCycle);
  }

  ///state管理
  static Future go2StateManager(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.StateManager);
  }

  ///文本、样式
  static Future go2TextAndStyle(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.TextAndFont);
  }

  ///按钮
  static Future go2Button(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Button);
  }

  ///图片
  static Future go2Image(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Image);
  }

  ///单选框和复选框
  static Future go2CheckBox(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.CheckBox);
  }

  ///输入框
  static Future go2TextFieldVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.TextField);
  }

  ///表单
  static Future go2ForumVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Forum);
  }

  ///进度条
  static Future go2ProgressIndicator(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ProgressIndicator);
  }

  ///布局类控件
  static Future go2LayoutPageVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Layout);
  }

  ///线性布局
  static Future go2LinearLayoutVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.LinearLayout);
  }

  ///弹性布局
  static Future go2FlexLayoutVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.FlexLayout);
  }

  ///流式布局
  static Future go2WrapFlowLayoutVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.WrapFlowLayout);
  }

  ///层叠布局
  static Future go2StackLayoutVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.StackLayout);
  }

  ///对齐和相对布局
  static Future go2AlignLayoutVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AlignLayout);
  }

  ///容器类组件
  static Future go2ContainerWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ContainerWidget);
  }

  ///padding
  static Future go2PaddingVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Padding);
  }

  ///尺寸限制类容器
  static Future go2ConstraintWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ConstraintWidget);
  }

  ///装饰容器
  static Future go2DecoratedBoxVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.DecoratedBox);
  }

  ///变换
  static Future go2TransformVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Transform);
  }

  ///容器
  static Future go2ContainerVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Container);
  }

  ///BottomNavigationBarVC
  static Future go2ScaffoldVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.BottomNavigationBarVC);
  }

  ///裁剪
  static Future go2ClipVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Clip);
  }

  ///可滚动组件
  static Future go2ScrollableWidget(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ScrollableWidget);
  }

  ///SingleChildScrollerView
  static Future go2SingleChildScrollerView(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.SingleChildScrollerView);
  }

  ///ListView
  static Future go2ListViewVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ListView);
  }

  ///GridView
  static Future go2GridViewVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.GridView);
  }

  ///CustomScrollerView
  static Future go2CustomScrollerViewVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.CustomScrollerView);
  }

  ///ScrollController
  static Future go2ScrollControllerVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ScrollController);
  }

  ///功能性组件
  static Future go2FunctionWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.FunctionWidget);
  }

  ///导航返回拦截
  static Future go2WillPopScopeVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.WillPopScope);
  }

  ///数据共享
  static Future go2InheritedWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.InheritedWidget);
  }

  ///跨组件状态共享
  static Future go2ProviderVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Provider);
  }

  ///颜色和主题
  static Future go2ColorAndThemeVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.ColorAndTheme);
  }

  ///异步UI更新
  static Future go2AsyncUIVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AsyncUI);
  }

  ///对话框
  static Future go2DialogVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Dialog);
  }

  ///事件处理和通知
  static Future go2EventAndNotificationVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.EventAndNotification);
  }

  ///原始指针事件处理
  static Future go2TouchEventVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.TouchEvent);
  }

  ///手势识别
  static Future go2GestureVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Gesture);
  }

  ///通知
  static Future go2NotificationVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.Notification);
  }

  ///动画
  static Future go2AnimationPageVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AnimationPage);
  }

  ///动画示例
  static Future go2AnimationSampleVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AnimationSample);
  }

  ///路由过渡动画
  static Future go2PageRouteAnimationVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.PageRouteAnimation);
  }

  ///Hero动画
  static Future go2HeroAnimationVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.HeroAnimation);
  }

  ///交织动画
  static Future go2StaggerAnimationVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.StaggerAnimation);
  }

  ///动画切换组件
  static Future go2AnimatedSwitcherVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AnimatedSwitcher);
  }

  ///动画过渡组件
  static Future go2AnimatedTransitionVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.AnimatedTransition);
  }

  ///自定义组件
  static Future go2CustomizeWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.CustomizeWidget);
  }

  ///组合组件
  static Future go2MakeUpWidgetVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.MakeUpWidget);
  }

  ///组合实例
  static Future go2MakeUpWidgetInstanceVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.MakeUpWidgetInstance);
  }

  ///自绘组件
  static Future go2CustomPaintVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.CustomPaint);
  }

  ///自绘实例
  static Future go2CustomPaintInstanceVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.CustomPaintInstance);
  }

  ///文件操作和网络请求
  static Future go2FileAndNetworkPageVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.FileAndNetwork);
  }

  ///文件操作
  static Future go2FileVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.File);
  }

  ///HttpClient
  static Future go2HttpClientVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.HttpClient);
  }

  ///HttpDio
  static Future go2HttpDioVC(BuildContext context) {
    return Navigator.pushNamed(context, RouteConstant.HttpDio);
  }
}

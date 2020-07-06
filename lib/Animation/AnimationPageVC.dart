import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/Animation/HeroAnimationVC.dart';
import 'package:testflutter/Animation/PageRouteAnimationVC.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class AnimationPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.title);
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("动画示例"),
            onTap: () {
              NavigatorHelper.go2AnimationSampleVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("路由过渡动画"),
            onTap: () {
//              NavigatorHelper.go2PageRouteAnimationVC(context);
//              pushRouteWithPageRouteBuilder(context);
              pushRouteWithPageRouteSubType(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  InkWell(//实现水波纹效果
                    child: Hero(
                      tag: "avatar",
                      child: ClipOval(
                        child: Image.asset(
                          "./images/avatar.jpg",
                          width: 50,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("原图"),
                            ),
                            body: HeroAnimationVC(),
                          ),
                        );
                      }));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Hero动画"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///[PageRouteBuilder]
  pushRouteWithPageRouteBuilder(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(microseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: PageRouteAnimationVC(),
              );
            }));
  }

  ///[PageRoute]
  pushRouteWithPageRouteSubType(BuildContext context) {
    Navigator.push(context, FadeRoute(builder: (context) {
      return PageRouteAnimationVC();
    }));
  }
}

class FadeRoute extends PageRoute {
  final WidgetBuilder builder;

  @override
  // TODO: implement barrierColor
  Color barrierColor;

  @override
  // TODO: implement barrierLabel
  String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return builder(context);
  }

  @override
  // TODO: implement maintainState
  bool maintainState;

  @override
  // TODO: implement transitionDuration
  Duration transitionDuration;

  @override
  bool opaque;

  @override
  bool barrierDismissible;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      return Padding(
        padding: EdgeInsets.zero,
      );
    }
  }

  FadeRoute(
      {@required this.builder,
      this.transitionDuration = const Duration(microseconds: 300),
      this.opaque = true,
      this.barrierDismissible = false,
      this.barrierColor,
      this.barrierLabel,
      this.maintainState = true});
}

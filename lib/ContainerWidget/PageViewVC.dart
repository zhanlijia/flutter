import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class PageViewVC extends BaseStatefulWidget {
  @override
  _PageViewVCState createState() {
    // TODO: implement createState
    return _PageViewVCState();
  }
}

class _PageViewVCState extends BaseState<PageViewVC> {
  PageController _pageController;

  List titles = ['语文', '数学', '英语'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(() {
      print("pageView listener ");
    });
    setState(() {
      _pageController.jumpToPage(0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
//      PageView(
//        scrollDirection: Axis.horizontal,
//        reverse: true,
//        controller: _pageController,
//        onPageChanged: (int index) {
//          print("pageView selected index $index");
//        },
//        children: titles
//            .map((e) => Container(
//                  alignment: Alignment.center,
//                  child: Text(e),
//                ))
//            .toList(),
//      );

        Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        controller: _pageController,
        onPageChanged: (int index) {
          print("pageView selected index $index");
        },
        children: titles
            .map((e) => Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(e),
                ))
            .toList(),
      ),
    );
  }
}

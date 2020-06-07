import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class WrapFlowLayoutVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("流式布局"),
        ),
        body: Column(
          children: <Widget>[
            Wrap(
              direction: Axis.horizontal,
              spacing: 15,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                    backgroundColor: Colors.blueAccent,
                  ),
                  label: Text("Human"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                    backgroundColor: Colors.blueAccent,
                  ),
                  label: Text("Human"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                    backgroundColor: Colors.blueAccent,
                  ),
                  label: Text("Human"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                    backgroundColor: Colors.blueAccent,
                  ),
                  label: Text("Human"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Flow(
                delegate: _TestFlowDelegate(margin: EdgeInsets.all(16)),
                children: <Widget>[
                  Container(
                    color: Colors.pinkAccent,
                    height: 80,
                    width: 80,
                  ),
                  Container(
                    color: Colors.redAccent,
                    height: 80,
                    width: 80,
                  ),
                  Container(
                    color: Colors.blueAccent,
                    height: 80,
                    width: 80,
                  ),
                  Container(
                    color: Colors.greenAccent,
                    height: 80,
                    width: 80,
                  ),
                  Container(
                    color: Colors.lightGreenAccent,
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _TestFlowDelegate extends FlowDelegate {

  EdgeInsets margin = EdgeInsets.zero;

  _TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var startX = margin.left;
    var startY = margin.top;

    for(var i = 0 ; i < context.childCount ; i++){
      var endX = startX + context.getChildSize(i).width + margin.right;
      if(endX < context.size.width){
        context.paintChild(i,transform: Matrix4.translationValues(startX, startY, 0));
        startX = endX + margin.left;
      }else{
        startX = margin.left;
        startY += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,transform: Matrix4.translationValues(startX, startY, 0));
        startX += context.getChildSize(i).width + margin.right + margin.left;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200);
  }
  @override
  bool shouldRepaint(FlowDelegate context) {

    // TODO: implement shouldRepaint
    return context != this;
  }

  
}

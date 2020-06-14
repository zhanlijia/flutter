import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ConstraintVC extends BaseStatelessWidget {
  Widget redBox =
      DecoratedBox(decoration: BoxDecoration(color: Colors.redAccent));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类容器"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                //BoxConstraints.expand()   BoxConstraints.tightFor()
                minHeight: 50,
              ),
              child: Container(
                  color: Colors.greenAccent,
                  height: 5, //没有作用，外面限制了最小高度50
                  width: double.infinity,
                  child: redBox),
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: redBox,
          ),
          Container(
            color: Colors.orangeAccent,
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                child: UnconstrainedBox(
                  //虽然破除了父控件的限制，子控件大小随自己，但是占用的控件并没有变小，父控件还是那么大
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 50, height: 50),
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  ),
                )),
          ),
          AspectRatio(//指定子控件长宽比
            aspectRatio: 4,
            child: redBox,
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
            child: FractionallySizedBox(//根据父控件宽高百分比
              widthFactor: 3,
              heightFactor: 0.4,
              child: redBox,
            ),
          )
        ],
      ),
    );
  }
}

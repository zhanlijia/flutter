import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ProgressIndicatorVC extends BaseStatefulWidget {
  @override
  _ProgressIndicatorVCState createState() {
    // TODO: implement createState
    return _ProgressIndicatorVCState();
  }
}

class _ProgressIndicatorVCState extends BaseState<ProgressIndicatorVC>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var colors = [
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.blueAccent
  ];
  int counter = 0;
  MaterialAccentColor curColor;

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
//        counter++;
//        print(counter);
//        curColor = colors[counter % colors.length];
      });
    });

    startTimer();
  }

  startTimer() async{
    while(true){
      await Future.delayed(Duration(seconds: 1),(){
        setState(() {
          counter++;
          curColor = colors[counter % colors.length];
        });

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      body: Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  value: 0.5,
                ),
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  value: 0.4,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(
                          begin: curColor, end: curColor)
                      .animate(_animationController),
//                  value: _animationController.value,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

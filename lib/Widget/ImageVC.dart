import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ImageVC extends BaseStatefulWidget {
  @override
  _ImageVCState createState() {
    // TODO: implement createState
    return _ImageVCState();
  }
}

class _ImageVCState extends BaseState<ImageVC> {
  var img = NetworkImage(
      "https://up.enterdesk.com/edpic/a4/28/59/a428591a505ba5a9f4ef8c3d7b69fd1a.jpg");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Container(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/preset_abdomen.png"),
                    width: 100,
                    color: Colors.blueAccent,
                    colorBlendMode: BlendMode.difference,
                  ),
                  Image.asset(
                    "images/preset_bladder.png",
                    width: 100,
                  ),
                  Image(
                    image: NetworkImage(
                        "http://pic1.sc.chinaz.com/files/pic/pic9/202005/apic25398.jpg"),
                    width: 100,
                    height: 50,
//                fit: BoxFit.fill,
                    repeat: ImageRepeat.repeatX,
                  ),
                  Image.network(
                    "https://up.enterdesk.com/edpic/a4/28/59/a428591a505ba5a9f4ef8c3d7b69fd1a.jpg",
                    width: 100,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Image>[
                        Image(
                          image: img,
                          height: 50.0,
                          width: 100.0,
                          fit: BoxFit.fill,
                        ),
                        Image(
                          image: img,
                          height: 50,
                          width: 50.0,
                          fit: BoxFit.contain,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.fitWidth,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.fitHeight,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.scaleDown,
                        ),
                        Image(
                          image: img,
                          height: 50.0,
                          width: 100.0,
                          fit: BoxFit.none,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          color: Colors.blue,
                          colorBlendMode: BlendMode.difference,
                          fit: BoxFit.fill,
                        ),
                        Image(
                          image: img,
                          width: 100.0,
                          height: 200.0,
                          repeat: ImageRepeat.repeatY,
                        )
                      ].map((e) {
                        return Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: SizedBox(
                                width: 100,
                                child: Container(
                                  color: Colors.redAccent,
                                  child: e,
                                ),
                              ),
                            ),
                            Text(e.fit.toString())
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

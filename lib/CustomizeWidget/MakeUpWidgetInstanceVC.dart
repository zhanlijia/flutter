import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class MakeUpWidgetInstanceVC extends BaseStatefulWidget {
  @override
  _MakeUpWidgetInstanceVCState createState() {
    // TODO: implement createState
    return _MakeUpWidgetInstanceVCState();
  }
}

class _MakeUpWidgetInstanceVCState extends BaseState<MakeUpWidgetInstanceVC> {
  double _turns = 0.0;
  int urlRichTextCount = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("组合实例"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 150,
              ),
            ),
            UrlRichText(
              text: "$urlRichTextCount",
              linkStyle: TextStyle(color: Colors.blue),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns += .2;
                  urlRichTextCount++;
                });
              },
              child: Text('顺时针选择1/5圈'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _turns -= .2;
                  urlRichTextCount++;
                });
              },
              child: Text("逆时针旋转1/5圈"),
            )
          ],
        ),
      ),
    );
  }
}

class TurnBox extends BaseStatefulWidget {
  final double turns;
  final int speed;
  final Widget child;

  TurnBox({Key key, this.turns, this.speed, this.child}) : super(key: key);

  @override
  _TurnBoxState createState() {
    // TODO: implement createState
    return _TurnBoxState();
  }
}

class _TurnBoxState extends BaseState<TurnBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        lowerBound: -double.infinity, upperBound: double.infinity, vsync: this);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}

class UrlRichText extends BaseStatefulWidget {
  final String text;
  final TextStyle linkStyle;

  UrlRichText({Key key, this.text, this.linkStyle}) : super(key: key);

  @override
  _UrlRichTextState createState() {
    // TODO: implement createState
    return _UrlRichTextState();
  }
}

class _UrlRichTextState extends BaseState<UrlRichText> {
  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {
    return TextSpan(text: DateTime.now().toString(), style: widget.linkStyle);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textSpan = parseText(widget.text);
  }

  @override
  void didUpdateWidget(UrlRichText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
  }
}

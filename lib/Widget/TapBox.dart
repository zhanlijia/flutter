import 'package:flutter/material.dart';

import '../BaseWidget.dart';

class TapBoxStateful extends BaseStatefulWidget {
  @override
  _TapBoxStatefulState createState() {
    // TODO: implement createState
    return _TapBoxStatefulState();
  }
}

class _TapBoxStatefulState extends BaseState<TapBoxStateful> {
  bool isActive = false;

  void toggleActive() {
    setState(() {
      this.isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: toggleActive,
      child: Container(
        child: Center(
          child: Text(
            isActive ? "active" : "unActive",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: isActive ? Colors.lightGreen : Colors.green[600]),
      ),
    );
  }
}

class TapBoxStateless extends BaseStatelessWidget {
  final bool isActive;
  final ValueChanged<bool> valueChanged;

  TapBoxStateless({Key key, this.isActive, @required this.valueChanged})
      : super(key: key);

  void onTap() {
    valueChanged(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            isActive ? "active" : "unActive",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration:
            BoxDecoration(color: isActive ? Colors.lightGreen : Colors.green),
      ),
    );
  }
}

class TapBoxMultipleState extends BaseStatefulWidget {
  final bool isActive;
  final ValueChanged<bool> activeChange;

  TapBoxMultipleState({Key key, this.isActive, @required this.activeChange})
      : super(key: key);

  @override
  _TapBoxMultipleStateState createState() {
    // TODO: implement createState
    return _TapBoxMultipleStateState();
  }
}

class _TapBoxMultipleStateState extends BaseState<TapBoxMultipleState> {
  bool isShowBorder = false;

  void onTap() {
//    setState(() {
    widget.activeChange(!widget.isActive);
//    });
  }

  void onTapDown(TapDownDetails details) {
    setState(() {
      isShowBorder = true;
    });
  }

  void onTapUp(TapUpDetails details) {
    setState(() {
      isShowBorder = false;
    });
  }

  void onTapCancel() {
    setState(() {
      isShowBorder = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.isActive ? "active" : "unActive",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        width: 200,
        height: 150,
        decoration: BoxDecoration(
            color: widget.isActive ? Colors.lightGreen : Colors.green,
            border: isShowBorder ? Border.all(color: Colors.teal) : null),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("--- base initState");
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key key}) : super(key: key){
    print("--- BaseStatefulWidget");
  }
}

abstract class BaseStatelessWidget extends StatelessWidget {
   BaseStatelessWidget({Key key}) : super(key: key){
     print("--- BaseStatelessWidget");
   }
}

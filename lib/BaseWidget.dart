import 'package:flutter/cupertino.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("+++ $this initState");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("+++ $this reassemble");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("+++ $this deactivate");
  }

  @override
  void didUpdateWidget(T oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("+++ $this didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("+++ $this didChangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("+++ $this dispose");
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key key}) : super(key: key){
    print("+++ $this init");
  }
}

abstract class BaseStatelessWidget extends StatelessWidget {
   BaseStatelessWidget({Key key}) : super(key: key){
     print("+++ $this init");
   }
}

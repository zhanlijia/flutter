

import 'package:flutter/material.dart';
import 'package:testflutter/Constant/RouteConstant.dart';

class NavigatorHelper{
  static Future go2NewPage(BuildContext context,String content){
    return Navigator.pushNamed(context, RouteConstant.NewPage , arguments: content);
  }


}
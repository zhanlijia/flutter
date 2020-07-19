import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../BaseWidget.dart';

class ImageWithPlaceholderVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("网络加载图片"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: getAvatar(
            url:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1595183685833&di=02fd70205c987e3213b38755fee97dc7&imgtype=0&src=http%3A%2F%2Ftupian.qqw21.com%2Farticle%2FUploadPic%2F2020-6%2F2020617225141628.jpg",
            width: 50.0,
//            borderRadius: BorderRadius.circular(25)
            ),
      ),
    );
  }
}

Widget getAvatar(
    {String url,
    double width = 30,
    double height,
    BoxFit fit,
    BorderRadius borderRadius}) {
  var placeholder = Image.asset(
    "./images/avatar.jpg",
    width: width,
    height: height,
  );
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) {
        return placeholder;
      },
      errorWidget: (context, url, error) {
        return placeholder;
      },
    ),
  );
}

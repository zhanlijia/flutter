import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class HttpDioDownloadRangeVC extends BaseStatefulWidget {
  @override
  _HttpDioDownloadRangeVCState createState() {
    // TODO: implement createState
    return _HttpDioDownloadRangeVCState();
  }
}

class _HttpDioDownloadRangeVCState extends BaseState<HttpDioDownloadRangeVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Http分块下载"),
      ),
    );
  }

  Future downloadWithChunks(url,savePath,ProgressCallabck)
}

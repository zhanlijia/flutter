import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testflutter/BaseWidget.dart';

class HttpDioDownloadRangeVC extends BaseStatefulWidget {
  @override
  _HttpDioDownloadRangeVCState createState() {
    // TODO: implement createState
    return _HttpDioDownloadRangeVCState();
  }
}

class _HttpDioDownloadRangeVCState extends BaseState<HttpDioDownloadRangeVC> {
  var showText = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Http分块下载"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("download"),
              onPressed: () async {
                var url =
                    "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
                var savePath = (await getApplicationDocumentsDirectory()).path +
                    "/HBuilder.9.0.2.macosx_64.dmg";
                await downloadWithChunks(url, savePath,
                    onReceiveProgress: (received, total) {
                  if (total != -1) {
                    setState(() {
                      showText = "${(received / total * 100).floor()}%";
                      print(showText);
                    });
                  }
                });
              },
            ),
            Text(showText)
          ],
        ),
      ),
    );
  }

  Future downloadWithChunks(url, savePath,
      {Function(int received, int total) onReceiveProgress}) async {
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    var dio = Dio();
    var progress = <int>[];

    createCallback(no) {
      return (int received, _) {
        progress[no] = received;
        if (onReceiveProgress != null && total != 0) {
          onReceiveProgress(
              progress.reduce((value, element) => value + element), total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no) async {
      progress.add(0);
      --end;
      return dio.download(url, savePath + "temp$no",
          onReceiveProgress: createCallback(no),
          options: Options(headers: {"range": "bytes=$start-$end"}));
    }

    Future mergeTempFiles(int chunk) async {
      File f = File(savePath + "temp0");
      IOSink ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
      for (int i = 1; i < chunk; ++i) {
        File _f = File(savePath + "temp$i");
        await ioSink.addStream(_f.openRead());
        await _f.delete();
      }
      await ioSink.close();
      await f.rename(savePath);
    }

    Response response = await downloadChunk(url, 0, firstChunkSize, 0);
    if (response.statusCode == 206) {
      total = int.parse(response.headers
          .value(HttpHeaders.contentRangeHeader)
          .split("/")
          .last);
      int reserved = total -
          int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
      int chunk = (reserved / firstChunkSize).ceil() + 1;
      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserved / maxChunk).ceil();
        }
        var futures = <Future>[];
        for (int i = 0; i < maxChunk; ++i) {
          int start = firstChunkSize + i * chunkSize;
          futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
        }
        await Future.wait(futures);
      }
      await mergeTempFiles(chunk);
    }
  }
}

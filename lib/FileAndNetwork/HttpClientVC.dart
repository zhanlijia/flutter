import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../BaseWidget.dart';

class HttpClientVC extends BaseStatefulWidget {
  @override
  _HttpClientVCState createState() {
    // TODO: implement createState
    return _HttpClientVCState();
  }
}

class _HttpClientVCState extends BaseState<HttpClientVC> {
  String responseString = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        doGet();
                      },
                child: Text("get"),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(responseString.replaceAll(RegExp(r"\s"), "")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future doGet() async {
    setState(() {
      isLoading = true;
      responseString = "正在请求。。。";
    });
    try {
      //HttpClient设置对整个HttpClient都生效，HttpClientRequest只对当前请求有效
      HttpClient client = HttpClient();
//      HttpClientRequest request =
//          await client.get("dc.siui.com", 8078, "/api/UserInfo");
//      request.headers.add("CustomToken", "fff3575611024fb9812998f722eb37ba");
      HttpClientRequest request =
          await client.getUrl(Uri.parse("https://www.baidu.com"));
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      HttpClientResponse response = await request.close();
      responseString = await response.transform(utf8.decoder).join();
      print("--- ${response.headers}");
      client.close();

      //所有请求都需认证，client初始化就调用addCredentials,添加全局凭证
//      client.addCredentials(url, realm, HttpClientBasicCredentials())
//      client.addCredentials(url, realm, HttpClientDigestCredentials())
      //动态添加凭证
//    client.authenticate = (url,scheme,realm) async{
//      if(url.host == "xxx.com" && realm == "admin"){
//        client.addCredentials(url, realm, credentials);
//        return true;
//      }
//      return false;
//    }

      //代理
//      client.findProxy = (uri) {
//        return "PROXY 192.168.1.2:8888";
//        //不需要代理返回"DIRECT"
//      };
      //代理身份验证
//      client.authenticateProxy =

      //证书校验
//      client.badCertificateCallback = (cert,host,port){
//        if(cert.pem == ){
//          return true;
//        }
//        return false;
//      }
      //自签名证书，添加到本地证书信任链忠，证书会自动通过，不会走badCertificateCallback
//      SecurityContext sc = SecurityContext();
//      sc.setTrustedCertificates((file));
//      client = HttpClient(context: sc);
    } catch (e, s) {
      responseString = "请求失败：$e";
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

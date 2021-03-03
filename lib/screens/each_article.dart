import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class EachArticle extends StatefulWidget {
  final String title;
  final String articleUrl;

  EachArticle({@required this.title, @required this.articleUrl});

  @override
  _EachArticleState createState() => _EachArticleState();
}

class _EachArticleState extends State<EachArticle> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _completer = Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}

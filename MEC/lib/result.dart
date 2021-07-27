import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'homepage.dart';

class ResultPage extends StatefulWidget {
  // const PaymentPage({ Key? key }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool showSpinner = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: WebView(
          initialUrl: "http://www.mahendra.info/result/",
          onPageFinished: (finished) {
            setState(() {
              showSpinner = false;
            });
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()
            ),
          );
        },
        child: Icon(Icons.home_outlined),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

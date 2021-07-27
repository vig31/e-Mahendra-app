import 'dart:async';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
bool showSpinner = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e-mahendra"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Mahendra Engineering college",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              accountEmail: Text("info@mahendrainstitutions.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  "MEI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("home"),
              trailing: Icon(Icons.home),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text("online Payment"),
              trailing: Icon(Icons.monetization_on),
              onTap: () => Navigator.of(context).pushNamed("payment"),
            ),
            ListTile(
              title: Text("Result"),
              trailing: Icon(Icons.school_rounded),
              onTap: () => Navigator.of(context).pushNamed("Result"),
            ),
            ListTile(
              title: Text("About MEI"),
              trailing: Icon(Icons.info_rounded),
              onTap: () => Navigator.of(context).pushNamed("AboutUs"),
            ),
            Divider(),
            ListTile(
              title: Text("close"),
              trailing: Icon(Icons.close_rounded),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: ModalProgressHUD(
            inAsyncCall: showSpinner,
              child: WebView(
          initialUrl: "http://www.mahendra.info",
         onPageFinished: (finished){
            setState(() {
              showSpinner = false;
            });
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },

          // http://mahendra.info/aboutmahendra.php
        ),
      ),
     
    );
  }
}

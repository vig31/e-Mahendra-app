import 'package:flutter/material.dart';
import 'homepage.dart';
import 'paymentpage.dart';
import 'aboutUs.dart';
import 'result.dart';
void main ()=> runApp(Myapp());

class Myapp extends StatelessWidget {
  // const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Mahendra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[900],
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "payment": (BuildContext context)=> PaymentPage(),
        "Result" : (BuildContext context)=> ResultPage(),
        "AboutUs" : (BuildContext context)=> AboutUsPage(),
      },
    );
  }
}
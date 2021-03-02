import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main_app/Color/color.dart';

import 'package:flutter_main_app/Home/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /// to time bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: new ShareColors().bluegrayColor,
    ));
    // end
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: new HomePage(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:pta_meeting/pages/comment.dart';
import 'package:pta_meeting/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PTA Meeting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.indigoAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Comfortaa'
      ),
      home: Home()
    );
  }
}

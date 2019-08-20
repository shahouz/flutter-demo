import 'package:flutter/material.dart';
import 'package:flutter_app/routes/frame.dart';
import 'package:flutter_app/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '斗图法宝',
      home: new Frame(),
      routes: Routes.get(),
    );
  }
}

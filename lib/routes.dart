import 'package:flutter/material.dart';
import 'package:flutter_app/routes/maker.dart';
import 'package:flutter_app/routes/home.dart';
import 'package:flutter_app/routes/statement.dart';

class Routes {
  static get() {
    return <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Home(),
      '/maker': (BuildContext context) => new Maker(),
      '/about': (BuildContext context) => new Statement(),
    };
  }
}
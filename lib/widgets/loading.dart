import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';

class Loading {
  static circle () {
    return Container(
      width:100.0,
      height:100.0,
      child: Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
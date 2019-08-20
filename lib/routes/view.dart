import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class View extends StatefulWidget {
  var url;

  View(String url) {
    this.url = url;
  }

  String getUrl() {
    return this.url;
  }

  @override
  createState() => new ViewPage(url);
}

class ViewPage extends State<View> {
  var url;

  ViewPage(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    String pic = this.url;
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black,
          child: Center(
            child: pic != null && pic.isNotEmpty ? Image.network(
              this.url,
              width: double.infinity,
            ) : Container(),
          ),
        ),
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

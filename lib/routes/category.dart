import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatefulWidget {
  @override
  createState() => new CategoryPage();
}

class CategoryPage extends State<Category> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Color(AppConstant.BG_YELLOW),
        elevation: 0.0,
      ),
      body: Container(),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}
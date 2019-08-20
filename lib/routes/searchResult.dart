import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResult extends StatefulWidget {
  @override
  createState() => new SearchPage();
}

class SearchPage extends State<SearchResult> {
  // 搜索框
  _searchBox() {
    return Container(
      width: double.infinity,
      color: Color(AppConstant.BG_YELLOW),
      padding: EdgeInsets.all(10.0),
      child: new Container(
        height: 50.0,
        padding: EdgeInsets.only(
          left: 20.0,
          bottom: 0.0,
          right: 20.0,
          top: 0.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100.0),
          border: new Border.all(
            color: Color(AppConstant.BORDER_GRAY),
            width: 2.0,
          ),
        ),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "搜索",
            labelStyle: TextStyle(
              color: Color(AppConstant.WORD_GRAY),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  _keywordList() {
    return Container();
  }

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
      body: Column(
        children: <Widget>[
          _searchBox(),
          _keywordList(),
        ],
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

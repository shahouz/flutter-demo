import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/common/layoutUtils.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'package:flutter_app/models/listModel.dart';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:http/http.dart' as http;

class SearchResult extends StatefulWidget {
  @override
  createState() => new SearchPage();
}

class SearchPage extends State<SearchResult> {
  var _data;

  Future<PostEntity> _doSearch(String keyword) async {
    final response = await http
        .get('${AppConstant.HOST}${AppConstant.URL_SEARCH}?word=$keyword');
    print('${AppConstant.HOST}${AppConstant.URL_SEARCH}?word=$keyword');
    final responseJson = json.decode(response.body);
    print(responseJson);
    setState(() {
      _data = new PostEntity.fromJson(responseJson);
    });

    print(_data.data);
    print(_data.message);

    return new PostEntity.fromJson(responseJson);
  }

  // 搜索框
  _searchBox(BuildContext context) {
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
          onSubmitted: (String str) {
            print("asd");
            _doSearch(str);
          },
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: InputDecoration(
            labelText: AppConstant.LANG_SEARCH,
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
    var result;
    var widget;
    ListModel model = new ListModel();
    if (_data != null) {
      result = _data.data;
      model.context = context;
      model.hasText = false;
      model.list = result['data'];
      model.title = "";
      widget = ListBox.create(model);
    } else {
      widget = Text("无内容");
    }

    return Container(
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Color(AppConstant.BG_YELLOW),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          _searchBox(context),
          LayoutUtils.blank10(),
          _keywordList(),
        ],
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

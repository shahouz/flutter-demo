import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'package:flutter_app/models/listModel.dart';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class Package extends StatefulWidget {
  var id;

  Package(String id) {
    this.id = id;
  }

  @override
  createState() => new PackagePage(this.id);
}

class PackagePage extends State<Package> {
  var id;

  PackagePage(String id) {
    this.id = id;
  }

  _blank10() {
    return Container(
      height: 10.0,
      width: double.infinity,
    );
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
      body: new ListView(
        children: <Widget>[
          _blank10(),
          PackageDetail.create(this.id, context),
        ],
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

class PackageDetail {
  static Future<PostEntity> fetchPackageData(String id, int count) async {
    print(
        '${AppConstant.HOST}${AppConstant.URL_PACKAGE_DETAIL}?emoticon_id=${id}&item_count=${count}');
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_PACKAGE_DETAIL}?emoticon_id=${id}&item_count=${count}');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  // 表情包列表
  static create(String id, BuildContext context) {
    return new FutureBuilder<PostEntity>(
      future: fetchPackageData(id, 60),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          var innerData = data['data'];
          var topicName = innerData['emoticon_bag_name'];
          var emoticons = innerData['emoticons'];

          ListModel model = new ListModel();
          model.title = topicName;
          model.list = emoticons;
          model.context = context;
          model.hasText = false;
          return ListBox.create(model);
        }
        return Loading.circle();
      },
    );
  }
}

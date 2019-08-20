import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'package:flutter_app/models/listModel.dart';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:http/http.dart' as http;

class PackageList {
  static Future<PostEntity> fetchPackageData(int page, int count) async {
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_TOPIC}?page=${page}&item_count=${count}');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  // 表情包列表
  static create(BuildContext con) {
    return new FutureBuilder<PostEntity>(
      future: fetchPackageData(1, 3),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          List<dynamic> dataList = data['data'];
          var result = new List<Widget>();
          for (Map<String, dynamic> item in dataList) {
            List<dynamic> list = item['emoticons'];
            ListModel model = new ListModel();
            model.title = item['name'];
            model.list = list;
            model.context = con;
            model.hasText = false;
            model.id = item['id'];
            result.add(
              ListBox.create(model),
            );
          }
          return new Container(
            child: Column(
              children: result,
            ),
          );
        }
        return Loading.circle();
      },
    );
  }
}
//the return type List<Widget> isn't a Widget, as defined by anonymous closure.

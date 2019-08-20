import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'dart:convert';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_app/models/listModel.dart';

class EmoticonList {
  static Future<PostEntity> fetchPackageData(int page, int count) async {
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_TOPIC}?page=$page&item_count=$count');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  static create(BuildContext context) {
    return new FutureBuilder<PostEntity>(
      future: fetchPackageData(1, 3),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          List<dynamic> dataList = data['data'];
          var result = new List<Widget>();
          for (Map<String, dynamic> item in dataList) {
            ListModel model = new ListModel();
            model.title = item['name'];
            model.list = item['emoticons'];
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

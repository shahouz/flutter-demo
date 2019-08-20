import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'dart:convert';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_app/models/listModel.dart';

class Newest {
  static Future<PostEntity> fetchNewestData(int page, int count) async {
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_NEWEST}?page=$page&item_count=$count');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  // 推荐
  static create(BuildContext context) {
    return new FutureBuilder<PostEntity>(
      future: fetchNewestData(1, 50),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          List<dynamic> emoticons = data['data'];
          ListModel model = new ListModel();
          model.title = AppConstant.LANG_NEWEST;
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

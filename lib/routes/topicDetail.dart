import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'dart:convert';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_app/models/listModel.dart';

class TopicDetail extends StatefulWidget {
  @override
  createState() => new TopicDetailPage();
}

class TopicDetailPage extends State<TopicDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Color(AppConstant.BG_YELLOW),
        elevation: 0.0,
      ),
      body: new ListView(
        children: <Widget>[
          TopicDetailList.create(context),
        ],
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

class TopicDetailList {
  static Future<PostEntity> fetchDetailList(int topicId, int count) async {
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_TOPIC_DETAIL}?topic_id=$topicId&item_count=$count');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  static create(BuildContext context) {
    return new FutureBuilder<PostEntity>(
      future: fetchDetailList(170, 3),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          List<dynamic> dataList = data['data']['emoticons'];
          ListModel model = new ListModel();
          model.title = data['data']['topic_name'];
          model.list = dataList;
          model.context = context;
          model.hasText = false;
          return ListBox.create(model);
        }
        return Loading.circle();
      },
    );
  }
}

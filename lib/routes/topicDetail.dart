import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'dart:convert';
import 'package:flutter_app/widgets/listBox.dart';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_app/models/listModel.dart';

// ignore: must_be_immutable
class TopicDetail extends StatefulWidget {
  var id;

  TopicDetail(int id) {
    this.id = id;
  }

  @override
  createState() => new TopicDetailPage(id);
}

class TopicDetailPage extends State<TopicDetail> {
  var id;

  TopicDetailPage(int id) {
    this.id = id;
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
      body: new ListView(
        children: <Widget>[
          TopicDetailList.create(this.id, context),
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

  static create(int id, BuildContext context) {
    return new FutureBuilder<PostEntity>(
      future: fetchDetailList(id, 3),
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

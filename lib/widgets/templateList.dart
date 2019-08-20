import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/PostEntity.dart';
import 'dart:convert';
import 'package:flutter_app/widgets/loading.dart';
import 'package:flutter_app/routes/view.dart';

class TemplateList {
  static Future<PostEntity> fetchTemplateListData(int page, int count) async {
    final response = await http.get(
        '${AppConstant.HOST}${AppConstant.URL_TEMPLATE_LIST}?page=$page&item_count=$count');
    final responseJson = json.decode(response.body);
    return new PostEntity.fromJson(responseJson);
  }

  static _itemBuilder(String url, BuildContext context) {
    var redirectPage = View(url);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (
              BuildContext context,
              Animation animation,
              Animation secondaryAnimation,
            ) {
              return redirectPage;
            },
          ),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: new Border.all(
            color: Color(AppConstant.BORDER_GRAY_3),
            width: 1.0,
          ),
          image: DecorationImage(image: new NetworkImage(url)),
        ),
      ),
    );
  }

  static _list(List<dynamic> list, BuildContext con) {
    var widgetList = new List<Widget>();
    for (Map<String, dynamic> item in list) {
      widgetList.add(_itemBuilder(item['url'], con));
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
      color: Colors.white,
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 5.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children: widgetList,
      ),
    );
  }

  static create() {
    return new FutureBuilder<PostEntity>(
      future: fetchTemplateListData(1, 30),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data;
          List<dynamic> dataList = data['data'];
          return _list(dataList, context);
        }
        return Loading.circle();
      },
    );
  }
}

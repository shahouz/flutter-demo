import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/emoticonItem.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/models/listModel.dart';
import 'package:flutter_app/routes/topicDetail.dart';

class ListBox {
  static _more(ListModel model) {
    var id = model.id;
    var redirectPage = TopicDetail();
    return id != null
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                model.context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  //动画时间为500毫秒
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
            child: Text(
              AppConstant.LANG_MORE,
              style: TextStyle(
                fontSize: AppConstant.FONT_12,
              ),
              textAlign: TextAlign.right,
            ),
          )
        : Container();
  }

  // 标题栏
  static _titleBox(ListModel model) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      alignment: Alignment.centerLeft,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Text(
              model.title,
              style: TextStyle(
                fontSize: AppConstant.FONT_16,
                color: Color(AppConstant.WORD_GRAY),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _more(model),
          )
        ],
      ),
    );
  }

  // 列表数据组装
  static _emoticonItemBuilder(
      List<dynamic> list, bool hasText, BuildContext con) {
    var result = new List<Widget>();
    for (Map<String, dynamic> item in list) {
      result.add(EmoticonItem.create(item, con));
    }
    return result;
  }

  // 内容栏
  static _contentBox(ListModel model) {
    List<dynamic> list = model.list;
    bool hasText = model.hasText;
    BuildContext context = model.context;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        children: list != null && list.length > 0
            ? _emoticonItemBuilder(list, hasText, context)
            : <Widget>[],
      ),
    );
  }

  // 列表
  static create(ListModel model) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          _titleBox(model),
          _contentBox(model),
        ],
      ),
    );
  }
}

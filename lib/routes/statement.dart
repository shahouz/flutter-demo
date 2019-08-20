import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';

class StatementPage extends State<Statement> {
  final colorYellow = 0xffFED640;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Color(0xffFED640),
        elevation: 0.0,
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '斗图法宝\n',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 50.0,
                  ),
                  child: Text(
                      '斗图法宝是一个可查看表情和自制表情的软件。您可以在这里找到有趣的表情，也可以快速制作表情，让您的生活更加欢乐！\n\n法律声明\n\n部分表情来自网络，其版权归原作者所有。由于一些图片几经转载，导致原作者信息不详。若版权方有异议，请及时反馈，我们会尽快处理。\n\n也欢迎您提供宝贵的意见和建议，使我们能越做越好。',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(AppConstant.WORD_GRAY),
                      )),
                ),
                new MaterialButton(
                  color: Colors.white,
                  textColor: Colors.black,
                  child: new Text('意见反馈'),
                  onPressed: () {
                    // ...
                  },
                ),
                Container(
                  height: 50.0,
                )
              ],
            ),
          ),
        ],
      ),
      // 主体背景颜色
      backgroundColor: Colors.white,
    );
  }
}

class Statement extends StatefulWidget {
  @override
  createState() => new StatementPage();
}

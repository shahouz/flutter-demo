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
                  padding: EdgeInsets.only(
                    bottom: 50.0,
                  ),
                  child: Text(AppConstant.LANG_DESC,
                      style: TextStyle(
                        fontSize: AppConstant.FONT_16,
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

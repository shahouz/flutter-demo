import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/routes/searchResult.dart';
import 'package:flutter_app/routes/package.dart';

class Search {
  static _searchInput(BuildContext context) {
    return GestureDetector(
      child: new Container(
        alignment: Alignment.center,
        child: Text(
          "搜索",
          style: TextStyle(
            color: Color(AppConstant.WORD_GRAY_LIGHT),
            fontSize: 14.0,
          ),
        ),
        //设置背景图片
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(
            width: 2.0,
            color: Color(AppConstant.BORDER_GRAY_2),
          ),
          borderRadius: new BorderRadius.all(
            new Radius.circular(20.0),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return new FadeTransition(
                //使用渐隐渐入过渡
                opacity: animation,
                child: SearchResult(), //路由B
              );
            },
          ),
        );
      },
    );
  }

  static create(BuildContext con) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 55.0,
      child: _searchInput(con),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/routes/searchResult.dart';

class Search {
  static _searchInput(BuildContext context) {
    return GestureDetector(
      child: new Container(
        alignment: Alignment.center,
        child: Text(
          AppConstant.LANG_SEARCH,
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
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (
              BuildContext context,
              Animation animation,
              Animation secondaryAnimation,
            ) {
              return new FadeTransition(
                opacity: animation,
                child: SearchResult(),
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

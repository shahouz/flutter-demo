import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/routes/category.dart';
import 'package:flutter_app/widgets/banners.dart';
import 'package:flutter_app/widgets/newest.dart';
import 'package:flutter_app/widgets/packageList.dart';
import 'package:flutter_app/widgets/recommend.dart';
import 'package:flutter_app/widgets/search.dart';
import 'package:flutter_app/common/layoutUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  createState() => new HomePage();
}

class HomePage extends State<Home> {
  // 首页
  _homePage(BuildContext con) {
    return new ListView(
      children: _tabIndex == 0 ? _yard(con) : _station(con),
    );
  }

  _flex(String url1, String url2, BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
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
                    return new Category();
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 80.0,
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(url1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
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
                    return new Category();
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 80.0,
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(url2),
                  fit: BoxFit.fill,
                ),
              ),
              child: FlatButton(onPressed: null, child: null),
            ),
          ),
        )
      ],
    );
  }

  _yard(BuildContext context) {
    var main = new List<Widget>();
    main.add(_tabBox());
    main.add(Banners.create());
    main.add(Search.create(context));
    main.add(Recommend.create(context));
    main.add(PackageList.create(context));
    return main;
  }

  _station(BuildContext context) {
    return <Widget>[
      _tabBox(),
      LayoutUtils.blank10(),
      _flex('assets/cate1.png', 'assets/cate2.png', context),
      _flex('assets/cate3.png', 'assets/cate4.png', context),
      Newest.create(context),
    ];
  }

  int _tabIndex = 0;

  _tabLeftButton(String text) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        decoration: new BoxDecoration(
          color:
              _tabIndex == 0 ? Colors.white : Color(AppConstant.BORDER_GRAY_2),
          border: new Border.all(
            width: 1.0,
            color: Color(AppConstant.BORDER_GRAY),
          ),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.zero,
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.zero,
          ),
        ),
        child: new MaterialButton(
          minWidth: double.infinity,
          height: double.infinity,
          textColor: Colors.black,
          child: new Text(
            text,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: _tabIndex == 0
                  ? Color(0xff333333)
                  : Color(AppConstant.WORD_GRAY),
            ),
          ),
          onPressed: () {
            setState(() {
              _tabIndex = 0;
            });
          },
        ),
      ),
    );
  }

  _tabRightButton(String text) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        decoration: new BoxDecoration(
          color:
              _tabIndex == 1 ? Colors.white : Color(AppConstant.BORDER_GRAY_2),
          border: new Border.all(
            width: 1.0,
            color: Color(AppConstant.BORDER_GRAY),
          ),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: new MaterialButton(
          minWidth: double.infinity,
          height: double.infinity,
          textColor: Colors.black,
          child: new Text(
            text,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: _tabIndex == 1
                  ? Color(0xff333333)
                  : Color(AppConstant.WORD_GRAY),
            ),
          ),
          onPressed: () {
            setState(() {
              _tabIndex = 1;
            });
          },
        ),
      ),
    );
  }

  _tabBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, .0, 15.0, 0.0),
      height: 60.0,
      color: Color(AppConstant.BG_YELLOW),
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          _tabLeftButton('斗图广场'),
          _tabRightButton('补给站'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(AppConstant.APP_NAME),
        backgroundColor: Color(AppConstant.BG_YELLOW),
        elevation: 0.0,
      ),
      body: _homePage(context),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

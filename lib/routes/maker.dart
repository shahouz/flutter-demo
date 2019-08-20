import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/widgets/templateList.dart';

class Maker extends StatefulWidget {
  @override
  createState() => new MakerPage();
}

class MakerPage extends State<Maker> {
  int _tabIndex = 0;

  _tabLeftButton() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border(
          top: BorderSide.none,
          right: BorderSide.none,
          bottom: _tabIndex == 0
              ? BorderSide(color: Color(AppConstant.BORDER_BLUE), width: 2.5)
              : BorderSide.none,
          left: BorderSide.none,
        ),
      ),
      child: new MaterialButton(
        minWidth: double.infinity,
        height: double.infinity,
        textColor: Colors.black,
        child: Text(
          '模板',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          setState(() {
            _tabIndex = 0;
          });
        },
      ),
    );
  }

  _tabRightButton() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border(
          top: BorderSide.none,
          right: BorderSide.none,
          bottom: _tabIndex == 1
              ? BorderSide(color: Color(AppConstant.BORDER_BLUE), width: 2.5)
              : BorderSide.none,
          left: BorderSide.none,
        ),
      ),
      child: new MaterialButton(
        minWidth: double.infinity,
        height: double.infinity,
        textColor: Colors.black,
        child: Text(
          '历史',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          setState(() {
            _tabIndex = 1;
          });
        },
      ),
    );
  }

  _tab() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      height: 45.0,
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _tabLeftButton(),
          ),
          Expanded(
            flex: 1,
            child: _tabRightButton(),
          ),
        ],
      ),
    );
  }

  _template() {
    return <Widget>[
      _tab(),
      TemplateList.create(),
    ];
  }

  _history() {
    return <Widget>[
      _tab(),
      Container(
        height: 200.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(AppConstant.LANG_HISTORY_EMPTY),
      ),
    ];
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
        children: _tabIndex == 0 ? _template() : _history(),
      ),
      backgroundColor: Color(AppConstant.BG_GRAY),
    );
  }
}

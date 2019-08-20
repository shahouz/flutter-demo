import 'package:flutter/material.dart';
import 'package:flutter_app/routes/maker.dart';
import 'package:flutter_app/routes/home.dart';
import 'package:flutter_app/routes/statement.dart';

class Frame extends StatefulWidget {
  @override
  createState() => new FrameMain();

}

class FrameMain extends State<Frame> {
  //当前选中的页面下标
  int _navCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildPage(int pageIndex, Widget page) {
    return new Offstage(
      offstage: _navCurrentIndex != pageIndex,
      child: new TickerMode(
        enabled: _navCurrentIndex == pageIndex,
        child: page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget body = new Center(
      child: new Stack(
        children: <Widget>[
          _buildPage(0, new Home()),
          _buildPage(1, new Maker()),
          _buildPage(2, new Statement()),
        ],
      ),
    );

    BottomNavigationBar botNavBar = new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _navCurrentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: new Text(
              '首页',
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.lightbulb_outline,
            ),
            title: new Text(
              '撸图',
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            title: new Text(
              '声明',
            )),
      ],
      onTap: (int index) {
        setState(() {
          _navCurrentIndex = index;
        });
      },
    );

    return new Scaffold(
      body: body,
      bottomNavigationBar:
      botNavBar, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
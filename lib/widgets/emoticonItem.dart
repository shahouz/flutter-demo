import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/routes/view.dart';
import 'package:flutter_app/routes/package.dart';

class EmoticonItem {
  static isNotBlank(String text) {
    return text != null && text.isNotEmpty;
  }

  static _avatar(String url) {
    return new Container(
      width: ScreenUtil.getInstance().setWidth(160),
      height: ScreenUtil.getInstance().setWidth(160),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.0),
        border: new Border.all(
          color: Color(AppConstant.BORDER_GRAY_2),
          width: 1.0,
        ),
        image: isNotBlank(url)
            ? DecorationImage(
                image: new NetworkImage(url),
                fit: BoxFit.contain,
              )
            : null,
      ),
    );
  }

  static _text(String text) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(160),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(AppConstant.WORD_GRAY),
        ),
      ),
    );
  }

  static emoticonItem(dynamic item, BuildContext context) {
    var widgetList = new List<Widget>();
    var emoticonThumbnailUrl = item['emoticon_thumbnail_url'];
    var thumbnailUrl = item['thumbnail_url'];
    var name = item['name'];
    var finalUrl =
        emoticonThumbnailUrl != null ? emoticonThumbnailUrl : thumbnailUrl;
    var emoticonId = item['emoticon_id'];
    var id = emoticonId != null ? emoticonId : item['id'];

    // 跳转的页面
    var redirectPage = Package(id.toString());
    // 是否显示标题
    widgetList.add(_avatar(finalUrl));
    if (name != '' && name != null) {
      widgetList.add(_text(name));
    }
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 10.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: widgetList,
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
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
      ),
    );
  }
}

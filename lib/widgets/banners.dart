import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Banners {
  static create() {
    return Container(
      height: 150.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://video.magicemoticon.cccwei.com/o_1bnd5jct819j7cpa1r2117je1blg48.jpg",
            fit: BoxFit.fill,
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        loop: true,
        duration: 1000,
        autoplay: true,
        onIndexChanged: (index) {
          //debugPrint("index:$index");
        },
        onTap: (index) {
          //debugPrint("点击了第:$index个");
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
        ),
        autoplayDisableOnInteraction: true,
      ),
    );
  }
}
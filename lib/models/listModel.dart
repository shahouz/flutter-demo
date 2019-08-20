import 'package:flutter_app/models/listItemModel.dart';
import 'package:flutter/material.dart';
class ListModel {
  int id;
  // 标题栏
  String title;
  // 内容
  List<dynamic> list;

  bool hasText;

  BuildContext context;
}

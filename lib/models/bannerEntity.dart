class BannerEntity {
  String id;
  String url;

  String getId() {
    return this.id;
  }

  String getUrl() {
    return this.url;
  }

  Map toJson() {
    Map map = new Map();
    map["id"] = this.id;
    map["url"] = this.url;
    return map;
  }

  static BannerEntity fromMap(Map<String, dynamic> map) {
    BannerEntity jsonModelDemo = new BannerEntity();
    jsonModelDemo.id = map['id'];
    jsonModelDemo.url = map['url'];

    print('url');
    print(map['url']);

    return jsonModelDemo;
  }

  @override
  String toString() {
    return 'BannerEntity{key: $id, value: $url}';
  }
}
class PostEntity {
  final String message;
  final Map<String, dynamic> data;

  PostEntity({this.message, this.data});

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return new PostEntity(message: json['message'], data: json['data']);
  }
}
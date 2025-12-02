// ignore: file_names
import 'dart:convert';

PostModle postModleFromJson(String str) => PostModle.fromJson(json.decode(str));

String postModleToJson(PostModle data) => json.encode(data.toJson());

class PostModle {
    int userId;
    int id;
    String title;
    String body;

    PostModle({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostModle.fromJson(Map<String, dynamic> json) => PostModle(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}

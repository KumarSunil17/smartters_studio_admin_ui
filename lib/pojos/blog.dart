// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

Blogs blogsFromJson(String str) => Blogs.fromJson(json.decode(str));

String blogsToJson(Blogs data) => json.encode(data.toJson());

class Blogs {
  List<Blog> data;

  Blogs({
    this.data,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        data: List<Blog>.from(json["data"].map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Blog {
  int id;
  String title;
  String description;
  String photo;
  String blogLink;
  DateTime timestamp;

  Blog({
    this.id,
    this.title,
    this.description,
    this.photo,
    this.blogLink,
    this.timestamp,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        blogLink: json["blog_link"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "blog_link": blogLink,
        "timestamp": timestamp.toIso8601String(),
      };
}

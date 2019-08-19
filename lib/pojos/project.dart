// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

Projects projectsFromJson(String str) => Projects.fromJson(json.decode(str));

String projectsToJson(Projects data) => json.encode(data.toJson());

class Projects {
  List<Project> data;

  Projects({
    this.data,
  });

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        data: List<Project>.from(json["data"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Project {
  int id;
  String name;
  String techUsed;
  String photo;
  String description;
  String link;
  DateTime startTime;
  DateTime endTime;
  DateTime timestamp;

  Project({
    this.id,
    this.name,
    this.techUsed,
    this.photo,
    this.description,
    this.link,
    this.startTime,
    this.endTime,
    this.timestamp,
  });

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
        id: json["id"],
        name: json["name"],
        techUsed: json["tech_used"],
        photo: json["photo"],
        description: json["description"],
        link: json["link"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tech_used": techUsed,
        "photo": photo,
        "description": description,
        "link": link,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "timestamp": timestamp.toIso8601String(),
      };
}

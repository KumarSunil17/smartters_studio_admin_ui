// To parse this JSON data, do
//
//     final teams = teamsFromJson(jsonString);

import 'dart:convert';

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));

String teamsToJson(Teams data) => json.encode(data.toJson());

class Teams {
  List<TeamMember> data;

  Teams({
    this.data,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        data: List<TeamMember>.from(
            json["data"].map((x) => TeamMember.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TeamMember {
  int id;
  String name;
  String designation;
  String photo;
  String fbLink;
  String instaLink;
  String linkedinLink;
  String githubLink;
  DateTime timestamp;

  TeamMember({
    this.id,
    this.name,
    this.designation,
    this.photo,
    this.fbLink,
    this.instaLink,
    this.linkedinLink,
    this.githubLink,
    this.timestamp,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        id: json["id"],
        name: json["name"],
        designation: json["designation"],
        photo: json["photo"],
        fbLink: json["fb_link"],
        instaLink: json["insta_link"],
        linkedinLink: json["linkedin_link"],
        githubLink: json["github_link"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "designation": designation,
        "photo": photo,
        "fb_link": fbLink,
        "insta_link": instaLink,
        "linkedin_link": linkedinLink,
        "github_link": githubLink,
        "timestamp": timestamp.toIso8601String(),
      };
}

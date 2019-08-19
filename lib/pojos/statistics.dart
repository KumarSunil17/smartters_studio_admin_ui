// To parse this JSON data, do
//
//     final statistics = statisticsFromJson(jsonString);

import 'dart:convert';

Statistics statisticsFromJson(String str) =>
    Statistics.fromJson(json.decode(str));

String statisticsToJson(Statistics data) => json.encode(data.toJson());

class Statistics {
  int subscriber;
  int member;
  int blog;
  int contact;

  Statistics({
    this.subscriber,
    this.member,
    this.blog,
    this.contact,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => new Statistics(
        subscriber: json["subscriber"],
        member: json["member"],
        blog: json["blog"],
        contact: json["contact"],
      );

  Map<String, dynamic> toJson() => {
        "subscriber": subscriber,
        "member": member,
        "blog": blog,
        "contact": contact,
      };
}

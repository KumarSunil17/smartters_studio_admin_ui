// To parse this JSON data, do
//
//     final subscriber = subscriberFromJson(jsonString);

import 'dart:convert';

SubscriberList subscriberFromJson(String str) =>
    SubscriberList.fromJson(json.decode(str));

String subscriberToJson(SubscriberList data) => json.encode(data.toJson());

class SubscriberList {
  List<Subscriber> data;

  SubscriberList({
    this.data,
  });

  factory SubscriberList.fromJson(Map<String, dynamic> json) => SubscriberList(
        data: new List<Subscriber>.from(
            json["data"].map((x) => Subscriber.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Subscriber {
  int id;
  String email;
  String ip;
  DateTime timestamp;

  bool selected = false;

  Subscriber({
    this.id,
    this.email,
    this.ip,
    this.timestamp,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) => new Subscriber(
        id: json["id"],
        email: json["email"],
        ip: json["ip"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "ip": ip,
        "timestamp": timestamp.toIso8601String(),
      };
}

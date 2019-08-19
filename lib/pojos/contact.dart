// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

ContactList contactFromJson(String str) =>
    ContactList.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class ContactList {
  List<Contact> data;

  ContactList({
    this.data,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
        data: List<Contact>.from(
            json["data"].map((x) => Contact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Contact {
  int id;
  String name;
  String email;
  String subject;
  String message;
  String ip;
  DateTime timestamp;

  Contact({
    this.id,
    this.name,
    this.email,
    this.subject,
    this.message,
    this.ip,
    this.timestamp,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        subject: json["subject"],
        message: json["message"],
        ip: json["ip"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "subject": subject,
        "message": message,
        "ip": ip,
        "timestamp": timestamp.toIso8601String(),
      };
}

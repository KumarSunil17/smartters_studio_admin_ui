import 'dart:convert';

List<Gallery> galleryListFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Gallery>.from(jsonData.map((x) => Gallery.fromJson(x)));
}

String galleryListToJson(List<Gallery> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Gallery {
  String id;
  String name;
  String time;

  Gallery({
    this.id,
    this.name,
    this.time,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "time": time,
      };
}

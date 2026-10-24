// To parse this JSON data, do
//
//     final addtask = addtaskFromJson(jsonString);

import 'dart:convert';

List<Addtask> addtaskFromJson(String str) => List<Addtask>.from(json.decode(str).map((x) => Addtask.fromJson(x)));

String addtaskToJson(List<Addtask> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Addtask {
    final String? title;
    final String? description;
    final String? id;

    Addtask({
        this.title,
        this.description,
        this.id,
    });

    factory Addtask.fromJson(Map<String, dynamic> json) => Addtask(
        title: json["title"],
        description: json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "id": id,
    };
}

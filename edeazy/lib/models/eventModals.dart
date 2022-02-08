// ignore_for_file: file_names
import 'dart:convert';

// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

Map<String, List<Events>> eventsFromJson(dynamic str) =>
    Map.from(str).map((k, v) => MapEntry<String, List<Events>>(
        k, List<Events>.from(v.map((x) => Events.fromJson(x)))));

String eventsToJson(Map<String, List<Events>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Events {
  Events({
    this.name,
    this.description,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  final String? name;
  final String? description;
  final int? endDate;
  final int? startTime;
  final int? endTime;

  Events copyWith({
    String? name,
    String? description,
    int? endDate,
    int? startTime,
    int? endTime,
  }) =>
      Events(
        name: name ?? this.name,
        description: description ?? this.description,
        endDate: endDate ?? this.endDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        name: json["name"],
        description: json["description"],
        endDate: json["endDateEpoch"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "endDateEpoch": endDate,
        "startTime": startTime,
        "endTime": endTime,
      };
}

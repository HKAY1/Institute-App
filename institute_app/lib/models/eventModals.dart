// ignore_for_file: file_names
import 'dart:convert';

class MyEvent {
  final String? name;
  final String? discription;
  final String? endTime;
  final String? startTime;
  final int endDate;
  final String? startDate;

  MyEvent(
      {this.name,
      this.discription,
      required this.endDate,
      this.endTime,
      this.startDate,
      this.startTime});
}

// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

Map<String, List<Events>> eventsFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Events>>(
        k, List<Events>.from(v.map((x) => Events.fromJson(x)))));

String eventsToJson(Map<String, List<Events>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Events {
  Events({
    this.name,
    this.discription,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  final String? name;
  final String? discription;
  final int? endDate;
  final String? startTime;
  final String? endTime;

  Events copyWith({
    String? name,
    String? discription,
    int? endDate,
    String? startTime,
    String? endTime,
  }) =>
      Events(
        name: name ?? this.name,
        discription: discription ?? this.discription,
        endDate: endDate ?? this.endDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        name: json["name"],
        discription: json["discription"],
        endDate: json["endDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "discription": discription,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
      };
}

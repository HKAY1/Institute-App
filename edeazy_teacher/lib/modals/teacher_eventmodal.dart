// ignore_for_file: file_names
import 'dart:convert';

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


PostEvents postEventsFromJson(String str) =>PostEvents.fromJson(json.decode(str));
String postEventsToJson(PostEvents data)=>json.encode(data.toJson());
class PostEvents {
  

  PostEvents({
    required this.classes,
    this.startDate,
    this.name,
    this.discription,
    this.endDate,
    this.startTime,
    this.endTime,
  });
  final List<String?> classes;
  final int? startDate;
  final String? name;
  final String? discription;
  final int? endDate;
  final int? startTime;
  final int? endTime;

  PostEvents copyWith({
    required List<String?> classes,
    int? startDate,
    String? name,
    String? discription,
    int? endDate,
    int? startTime,
    int? endTime,
  }) =>
      PostEvents(
        classes: classes,
        startDate: startDate??this.startDate,
        name: name ?? this.name,
        discription: discription ?? this.discription,
        endDate: endDate ?? this.endDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory PostEvents.fromJson(Map<String, dynamic> json) => PostEvents(
        name: json["name"],
        classes: json["classes"],
        startDate: json["startDate"],
        discription: json["discription"],
        endDate: json["endDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "classes":classes,
        "name": name,
        "startDate":startDate,
        "discription": discription,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
      };
}

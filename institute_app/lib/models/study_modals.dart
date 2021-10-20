// To parse this JSON data, do
//
//     final study = studyFromJson(jsonString);

import 'dart:convert';

Study studyFromJson(String str) => Study.fromJson(json.decode(str));

String studyToJson(Study data) => json.encode(data.toJson());

class Study {
  Study({
    this.notes,
    this.assignment,
    this.tests,
  });

  final List<Note>? notes;
  final List<Assignment>? assignment;
  final List<Assignment>? tests;

  Study copyWith({
    List<Note>? notes,
    List<Assignment>? assignment,
    List<Assignment>? tests,
  }) =>
      Study(
        notes: notes ?? this.notes,
        assignment: assignment ?? this.assignment,
        tests: tests ?? this.tests,
      );

  factory Study.fromJson(Map<String, dynamic> json) => Study(
        notes: json["notes"] == null
            ? null
            : List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        assignment: json["assignment"] == null
            ? null
            : List<Assignment>.from(
                json["assignment"].map((x) => Assignment.fromJson(x))),
        tests: json["tests"] == null
            ? null
            : List<Assignment>.from(
                json["tests"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": notes == null
            ? null
            : List<dynamic>.from(notes!.map((x) => x.toJson())),
        "assignment": assignment == null
            ? null
            : List<dynamic>.from(assignment!.map((x) => x.toJson())),
        "tests": tests == null
            ? null
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
      };
}

class Assignment {
  Assignment({
    this.topic,
    this.file,
  });

  final String? topic;
  final String? file;

  Assignment copyWith({
    String? topic,
    String? file,
  }) =>
      Assignment(
        topic: topic ?? this.topic,
        file: file ?? this.file,
      );

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        topic: json["topic"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "file": file,
      };
}

class Note {
  Note({
    this.chapter,
    this.data,
  });

  final int? chapter;
  final List<Assignment>? data;

  Note copyWith({
    int? chapter,
    List<Assignment>? data,
  }) =>
      Note(
        chapter: chapter ?? this.chapter,
        data: data ?? this.data,
      );

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        chapter: json["chapter"],
        data: json["data"] == null
            ? null
            : List<Assignment>.from(
                json["data"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

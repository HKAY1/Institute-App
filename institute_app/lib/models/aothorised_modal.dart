// To parse this JSON data, do
//
//     final myEvents = myEventsFromJson(jsonString);

import 'dart:convert';

UserData myEventsFromJson(String str) => UserData.fromJson(json.decode(str));

String myEventsToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.success,
    this.data,
  });

  final bool success;
  final UserInfo? data;

  UserData copyWith({
    bool? success,
    UserInfo? data,
  }) =>
      UserData(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        success: json["success"],
        data: UserInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
      };
}

class UserInfo {
  UserInfo({
    required this.token,
    required this.url,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.dataClass,
    required this.gender,
    required this.role,
  });

  final String token;
  final String url;
  final String name;
  final String address;
  final String email;
  final int phoneNumber;
  final List<Class> dataClass;
  final String gender;
  final String role;

  UserInfo copyWith({
    String? token,
    String? url,
    String? name,
    String? address,
    String? email,
    int? phoneNumber,
    List<Class>? dataClass,
    String? gender,
    String? role,
  }) =>
      UserInfo(
        token: token ?? this.token,
        url: url ?? this.url,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dataClass: dataClass ?? this.dataClass,
        gender: gender ?? this.gender,
        role: role ?? this.role,
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        token: json["token"],
        url: json["imageUrl"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        dataClass:
            List<Class>.from(json["class"].map((x) => Class.fromJson(x))),
        gender: json["gender"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "imageUrl": url,
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "class": List<dynamic>.from(dataClass.map((x) => x.toJson())),
        "gender": gender,
        "role": role,
      };
}

class Class {
  Class({
    required this.name,
    required this.subjects,
    required this.id,
  });

  final String name;
  final List<String> subjects;
  final String id;

  Class copyWith({
    String? name,
    List<String>? subjects,
    String? id,
  }) =>
      Class(
        name: name ?? this.name,
        subjects: subjects ?? this.subjects,
        id: id ?? this.id,
      );

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        name: json["name"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "_id": id,
      };
}

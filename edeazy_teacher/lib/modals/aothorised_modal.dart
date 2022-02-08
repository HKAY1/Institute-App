// To parse this JSON data, do
//
//     final myEvents = myEventsFromJson(jsonString);

import 'dart:convert';

UserData myEventsFromJson(String str) => UserData.fromJson(json.decode(str));

String myEventsToJson(UserData data) => json.encode(data.toJson());

// class UserBasic {
//   UserBasic({
//     required this.token,
//     required this.url,
//     required this.name,
//     // required this.address,
//     // required this.email,
//     // required this.phoneNumber,
//     // required this.clas,
//     // required this.gender,
//     // required this.role,
//     // required this.subjects,
//   });

//   final String token;
//   final String url;
//   final String name;
//   // final String address;
//   // final String email;
//   // final int phoneNumber;
//   // final String clas;
//   // final String gender;
//   // final String role;
//   // final List<String> subjects;

//   UserBasic copyWith({
//     String? token,
//     String? url,
//     String? name,
//     // String? address,
//     // String? email,
//     // int? phoneNumber,
//     // String? clas,
//     // String? gender,
//     // String? role,
//     // List<String>? subjects,
//   }) =>
//       UserBasic(
//         token: token ?? this.token,
//         url: url ?? this.url,
//         name: name ?? this.name,
//         // address: address ?? this.address,
//         // email: email ?? this.email,
//         // phoneNumber: phoneNumber ?? this.phoneNumber,
//         // clas: clas ?? this.clas,
//         // gender: gender ?? this.gender,
//         // role: role ?? this.role,
//         // subjects: subjects ?? this.subjects,
//       );

//   factory UserBasic.fromJson(Map<String, dynamic> json) => UserBasic(
//         token: json["token"],
//         url: json["imageUrl"],
//         name: json["name"],
//         // address: json["address"],
//         // email: json["email"],
//         // phoneNumber: json["phoneNumber"],
//         // clas: json["class"],
//         // gender: json["gender"],
//         // role: json["role"],
//         // subjects: List<String>.from(json["subjects"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "imageUrl": url,
//         "name": name,
//         // "address": address,
//         // "email": email,
//         // "phoneNumber": phoneNumber,
//         // "class": clas,
//         // "gender": gender,
//         // "role": role,
//         // "subjects": List<dynamic>.from(subjects.map((x) => x)),
//       };
// }

class UserData {
  UserData({
    required this.token,
    required this.url,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.role,
    required this.id,
  });

  final String token;
  final String url;
  final String name;
  final String address;
  final String email;
  final int phoneNumber;
  final String gender;
  final String role;
  final String id;

  UserData copyWith({
    String? token,
    String? url,
    String? name,
    String? address,
    String? email,
    int? phoneNumber,
    String? gender,
    String? role,
    String? id,
  }) =>
      UserData(
        token: token ?? this.token,
        url: url ?? this.url,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        id: id ?? this.id,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        url: json["imageUrl"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        role: json["role"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "imageUrl": url,
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "role": role,
        "_id": id,
      };
}

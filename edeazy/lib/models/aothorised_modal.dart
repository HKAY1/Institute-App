import 'dart:convert';

UserData myEventsFromJson(String str) => UserData.fromJson(json.decode(str));

String myEventsToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.token,
    required this.organisationId,
    required this.url,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.lectures,
    required this.gender,
    required this.role,
    required this.id,
    // required this.subjects,
  });

  final String token;
  final String organisationId;
  final String url;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final List<String> lectures;
  final String gender;
  final String role;
  final String id;
  // final List<String> subjects;

  UserData copyWith({
    String? token,
    String? organisationId,
    String? url,
    String? name,
    String? address,
    String? email,
    String? phoneNumber,
    List<String>? lectures,
    String? gender,
    String? role,
    String? id,
    List<String>? subjects,
  }) =>
      UserData(
        token: token ?? this.token,
        organisationId: organisationId ?? this.organisationId,
        url: url ?? this.url,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        lectures: lectures ?? this.lectures,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        id: id ?? this.id,
        // subjects: subjects ?? this.subjects,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        organisationId: json["organisationId"],
        url: json["imageUrl"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        lectures: List<String>.from(json["lectureIds"].map((x) => x)),
        gender: json["gender"],
        role: json["role"],
        id: json["_id"],
        // subjects: List<String>.from(json["subjects"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "organisationId": organisationId,
        "imageUrl": url,
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "lectureIds": List<dynamic>.from(lectures.map((x) => x)),
        "gender": gender,
        "role": role,
        "_id": id,
        // "subjects": List<dynamic>.from(subjects.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);
List<Teacher> teacherclasfrom(json)=>
List.from(json).map((e) => Teacher.fromJson(e)).toList();
List<Map<String,dynamic>>teacherclasto(List<Teacher>c)=>
c.map((e) => e.toJson()).toList();

class Teacher {
    Teacher({
        required this.teacherClass,
        required this.subject,
    });

    final String teacherClass;
    final List<String> subject;

    Teacher copyWith({
        String? teacherClass,
        List<String>? subject,
    }) => 
        Teacher(
            teacherClass: teacherClass ?? this.teacherClass,
            subject: subject ?? this.subject,
        );

    factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherClass: json["class"],
        subject: List<String>.from(json["subjects"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "class": teacherClass,
        "subjects": List<dynamic>.from(subject.map((x) => x)),
    };
}

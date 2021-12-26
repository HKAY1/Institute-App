//Modals for Techer Classes and Subjetcs
List<Teacher> teacherclasfrom(json) =>
    List.from(json).map((e) => Teacher.fromJson(e)).toList();
List<Map<String, dynamic>> teacherclasto(List<Teacher> c) =>
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

//Modals for Chapter Notes
List<Notes> notesfrom(json) =>
    List.from(json).map((e) => Notes.fromJson(e)).toList();
List<Map<String, dynamic>> notesto(List<Notes> subj) =>
    subj.map((e) => e.toJson()).toList();

class Notes {
  Notes({
    required this.chapterid,
    required this.chapterName,
    required this.chapterNo,
  });
  late final String chapterid;
  late final String chapterName;
  late final int chapterNo;

  Notes.fromJson(Map<String, dynamic> json) {
    chapterName = json['chapterName'];
    chapterid = json['_id'];
    chapterNo = json['chapterNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chapterName'] = chapterName;
    _data['_id'] = chapterid;
    _data['chapterNumber'] = chapterName;
    return _data;
  }
}

//Modals For Secondary Materials Like Assignment or Sample-Paper
List<SecondaryMatModal> secmatfrom(json) =>
    List.from(json).map((e) => SecondaryMatModal.fromJson(e)).toList();
List<Map<String, dynamic>> secmatto(List<SecondaryMatModal> subj) =>
    subj.map((e) => e.toJson()).toList();

class SecondaryMatModal {
  SecondaryMatModal({
    required this.topic,
    required this.file,
  });
  late final String topic;
  late final FileClass file;

  SecondaryMatModal.fromJson(Map<String, dynamic> json) {
    topic = json['name'];
    file = FileClass.fromJson(json['file']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = topic;
    _data['file'] = file.toJson();
    return _data;
  }
}

//Modals for Chapter Topics
List<Topics> topicsfrom(json) =>
    List.from(json).map((e) => Topics.fromJson(e)).toList();
List<Map<String, dynamic>> topicsto(List<Topics> subj) =>
    subj.map((e) => e.toJson()).toList();

class Topics {
  Topics({
    required this.topic,
    required this.id,
    required this.file,
  });
  late final String topic;
  late final String id;
  late final FileClass file;

  Topics.fromJson(Map<String, dynamic> json) {
    topic = json['name'];
    id = json['_id'];
    file = FileClass.fromJson(json['file']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = topic;
    _data['_id'] = id;
    _data['file'] = file.toJson();
    return _data;
  }
}

//PDF File Modal Class
class FileClass {
  FileClass({
    required this.name,
    required this.url,
    this.id = '',
  });

  final String name;
  final String url;
  final String id;

  FileClass copyWith({
    String? name,
    String? url,
  }) =>
      FileClass(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        name: json["name"],
        url: json["url"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "_id": url,
      };
}

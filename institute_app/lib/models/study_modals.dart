// class StudentSubj {
//   StudentSubj({
//     required this.success,
//     required this.subjData,
//   });
//   late final bool success;
//   late final List<SubjData> subjData;

//   StudentSubj.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     subjData =
//         List.from(json['data']).map((e) => SubjData.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['data'] = subjData.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

List<SubjData> subjfromjason(json) =>
    List.from(json).map((e) => SubjData.fromJson(e)).toList();
List<Map<String, dynamic>> subjtojson(List<SubjData> subj) =>
    subj.map((e) => e.toJson()).toList();

class SubjData {
  SubjData({
    required this.id,
    required this.clas,
    required this.subject,
    required this.teacherId,
    required this.teacherName,
  });
  late final String id;
  late final String clas;
  late final String subject;
  late final String teacherId;
  late final String teacherName;

  SubjData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    clas = json['class'];
    subject = json['subject'];
    teacherId = json['teacherId'];
    teacherName = json['teacherName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['class'] = clas;
    _data['subject'] = subject;
    _data['teacherId'] = teacherId;
    _data['teacherName'] = teacherName;
    return _data;
  }
}

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

class FileClass {
  FileClass({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

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
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Assignment {
  Assignment({
    required this.topic,
    required this.chapter,
    required this.file,
  });
  late final String topic;
  late final int chapter;
  late final String file;

  Assignment.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    chapter = json['chapter'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['topic'] = topic;
    _data['chapter'] = chapter;
    _data['file'] = file;
    return _data;
  }
}

class Tests {
  Tests({
    required this.topic,
    required this.file,
  });
  late final String topic;
  late final String file;

  Tests.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['topic'] = topic;
    _data['file'] = file;
    return _data;
  }
}

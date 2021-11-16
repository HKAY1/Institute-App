// class StudyMaterial {
//   StudyMaterial({
//     required this.notes,
//     required this.assignment,
//     required this.tests,
//   });
//   late final List<Notes> notes;
//   late final List<Assignment> assignment;
//   late final List<Tests> tests;

//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     notes = List.from(json['notes']).map((e)=>Notes.fromJson(e)).toList();
//     assignment = List.from(json['assignment']).map((e)=>Assignment.fromJson(e)).toList();
//     tests = List.from(json['tests']).map((e)=>Tests.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['notes'] = notes.map((e)=>e.toJson()).toList();
//     _data['assignment'] = assignment.map((e)=>e.toJson()).toList();
//     _data['tests'] = tests.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

class Notes {
  Notes({
    required this.chapter,
    required this.title,
    required this.data,
  });
  late final int chapter;
  late final String title;
  late final List<Data> data;

  Notes.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    title = json['title'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chapter'] = chapter;
    _data['title'] = title;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.topic,
    required this.file,
  });
  late final String topic;
  late final String file;

  Data.fromJson(Map<String, dynamic> json) {
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

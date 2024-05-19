/// message : "Succes"
/// data : [{"id":2,"title":"Ujian Fisika XI","code_quiz":"6510111394","create_by":"1","quiz_date":"2024-05-13","course":"fisika","start":"07:30:00","end":"09:30:00","status":"off","created_at":"2024-05-05T03:29:46.000000Z","updated_at":"2024-05-05T03:29:46.000000Z"},{"id":3,"title":"Ujian Bahasa Inggris Bab VII","code_quiz":"2995864533","create_by":"1","quiz_date":"2024-05-07","course":"inggris","start":"11:00:00","end":"13:00:00","status":"off","created_at":"2024-05-05T03:30:37.000000Z","updated_at":"2024-05-05T03:30:37.000000Z"}]

class Quiz {
  Quiz({
      String? message, 
      List<Data>? data,}){
    _message = message;
    _data = data;
}

  Quiz.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  List<Data>? _data;
Quiz copyWith({  String? message,
  List<Data>? data,
}) => Quiz(  message: message ?? _message,
  data: data ?? _data,
);
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// title : "Ujian Fisika XI"
/// code_quiz : "6510111394"
/// create_by : "1"
/// quiz_date : "2024-05-13"
/// course : "fisika"
/// start : "07:30:00"
/// end : "09:30:00"
/// status : "off"
/// created_at : "2024-05-05T03:29:46.000000Z"
/// updated_at : "2024-05-05T03:29:46.000000Z"

class Data {
  Data({
      num? id, 
      String? title, 
      String? codeQuiz, 
      String? createBy, 
      String? quizDate, 
      String? course, 
      String? start, 
      String? end, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _codeQuiz = codeQuiz;
    _createBy = createBy;
    _quizDate = quizDate;
    _course = course;
    _start = start;
    _end = end;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _codeQuiz = json['code_quiz'];
    _createBy = json['create_by'];
    _quizDate = json['quiz_date'];
    _course = json['course'];
    _start = json['start'];
    _end = json['end'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _codeQuiz;
  String? _createBy;
  String? _quizDate;
  String? _course;
  String? _start;
  String? _end;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? title,
  String? codeQuiz,
  String? createBy,
  String? quizDate,
  String? course,
  String? start,
  String? end,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  codeQuiz: codeQuiz ?? _codeQuiz,
  createBy: createBy ?? _createBy,
  quizDate: quizDate ?? _quizDate,
  course: course ?? _course,
  start: start ?? _start,
  end: end ?? _end,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get codeQuiz => _codeQuiz;
  String? get createBy => _createBy;
  String? get quizDate => _quizDate;
  String? get course => _course;
  String? get start => _start;
  String? get end => _end;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['code_quiz'] = _codeQuiz;
    map['create_by'] = _createBy;
    map['quiz_date'] = _quizDate;
    map['course'] = _course;
    map['start'] = _start;
    map['end'] = _end;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
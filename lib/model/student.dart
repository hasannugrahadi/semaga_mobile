/// id : 1
/// nis : "12345"
/// name : "Hasan Khuluq Nugrahadi"
/// grade : "XII"
/// gender : "L"
/// email : "hknx78@gmail.com"
/// email_verified_at : null
/// created_at : "2024-04-27T18:16:50.000000Z"
/// updated_at : "2024-04-27T18:16:50.000000Z"

class Student {
  Student({
      num? id, 
      num? nis,
      String? name, 
      String? grade, 
      String? gender, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _nis = nis;
    _name = name;
    _grade = grade;
    _gender = gender;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Student.fromJson(dynamic json) {
    _id = json['id'];
    _nis = json['nis'];
    _name = json['name'];
    _grade = json['grade'];
    _gender = json['gender'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _nis;
  String? _name;
  String? _grade;
  String? _gender;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
Student copyWith({  num? id,
  num? nis,
  String? name,
  String? grade,
  String? gender,
  String? email,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
}) => Student(  id: id ?? _id,
  nis: nis ?? _nis,
  name: name ?? _name,
  grade: grade ?? _grade,
  gender: gender ?? _gender,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get nis => _nis;
  String? get name => _name;
  String? get grade => _grade;
  String? get gender => _gender;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nis'] = _nis;
    map['name'] = _name;
    map['grade'] = _grade;
    map['gender'] = _gender;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
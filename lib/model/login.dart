import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login {
  String message;
  String access_token;
  String token_type;

  Login({
    required this.message,
    required this.access_token,
    required this.token_type
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);

}
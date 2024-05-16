import 'dart:convert';
import 'package:semaga_mobile/model/services/base_service.dart';

import '../model/login.dart';
import 'package:http/http.dart' as http;

class LoginViewModel{

  late Login login;

  Future<void> fetchLogin(String nis, String password) async {
    final response = await http.post(Uri.parse(BaseService.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nis': nis,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      login = Login.fromJson(responseData);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
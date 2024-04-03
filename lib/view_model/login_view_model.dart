import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_request.dart';

class LoginViewModel {
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/login');
    var response = await http.post(
      url,
      body: request.toJson(),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return {
        'message': data['message'],
        'access_token': data['access_token'],
        'token_type': data['token_type'],
      };
    } else {
      return {
        'error': 'An error occurred',
      };
    }
  }
}
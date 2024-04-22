import 'dart:convert';
import '../models/login.dart';
import 'package:http/http.dart' as http;

class LoginViewModel{
  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<Login> fetchLogin(String nis, password) async {
    final response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nis': nis,
        'password': password
        // Add any other data you want to send in the body
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
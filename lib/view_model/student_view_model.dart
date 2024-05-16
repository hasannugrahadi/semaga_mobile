import 'dart:convert';
import 'package:semaga_mobile/model/services/base_service.dart';
import 'package:http/http.dart' as http;
import '../model/student.dart';

class StudentViewModel{

  late Student student;

  Future<void> fetchStudent(String token) async {
    final response = await http.get(Uri.parse(BaseService.studentUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      student = Student.fromJson(responseData);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
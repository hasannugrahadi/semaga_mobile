import 'dart:convert';
import 'package:semaga_mobile/model/services/base_service.dart';
import '../model/quiz.dart';
import 'package:http/http.dart' as http;

class QuizViewModel{

  late List<Data> quizzes;

  Future<void> fetchQuiz(String token) async {
    final response = await http.get(Uri.parse(BaseService.quizUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> quizDataList = responseData['data'];
      quizzes = quizDataList.map((quizData) => Data.fromJson(quizData)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
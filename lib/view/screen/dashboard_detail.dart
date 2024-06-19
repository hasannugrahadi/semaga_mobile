import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/model/quiz.dart';
import 'package:semaga_mobile/view/reusable_widget/table_detail_dashboard.dart';
import 'package:semaga_mobile/view/screen/warning_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/quiz_view_model.dart';

class DetailQuiz extends StatefulWidget {

  final int quizID;

  const DetailQuiz({super.key, required this.quizID});

  @override
  State<DetailQuiz> createState() => _DetailQuizState();
}

class _DetailQuizState extends State<DetailQuiz> {

  final QuizViewModel _quizViewModel = QuizViewModel();

  String _token = '';

  late List<Data> quizzes = [];
  late Data quizDetail = Data.defaultData();

  void _loadDetailQuiz(token) async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? '';
    });
    await _quizViewModel.fetchQuiz(token);
    setState(() {
      quizzes = _quizViewModel.quizzes;
      quizDetail = quizzes.elementAt(widget.quizID);
    });
  }

  @override
  void initState() {
    _loadDetailQuiz(_token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String startTime = quizDetail.start?.substring(0, 5) ?? '-';
    String endTime = quizDetail.end?.substring(0, 5) ?? '-';

    DateTime startDateTime = DateTime.parse('1970-01-01 $startTime:00');
    DateTime endDateTime = DateTime.parse('1970-01-01 $endTime:00');

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back), iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
        ),
        title: Text(quizDetail.course?.toUpperCase() ?? '-',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 24,
            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: const Color(0xff4682A9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quizDetail.title?.toUpperCase() ?? '-',
              style:
              TextStyle(
                color: const Color(0xff1E3A4B),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: GoogleFonts
                    .robotoCondensed()
                    .fontFamily,
              ),
            ),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(
                      Icons.class_, color: Color(0xff1E3A4B),)),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(width: 4),
                    ),
                    TextSpan(
                        text: "Guru: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts
                              .robotoCondensed()
                              .fontFamily,
                        )
                    ),
                    TextSpan(
                        text: "Fadias NA, S.Pd",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          fontFamily: GoogleFonts
                              .robotoCondensed()
                              .fontFamily,
                        )
                    ),
                  ]
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Deskripsi',
              style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              fontFamily: GoogleFonts
                  .robotoCondensed()
                  .fontFamily,
              )
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xff000000)),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return const Text(
                    'Kerjakan dengan jujur dan berani',
                    // Use a Text widget to measure the text's height
                    style: TextStyle(fontSize: 16), // Adjust font size as needed
                    maxLines: null, // Allow the text to wrap to multiple lines
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Text.rich(
              TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(
                      Icons.info_rounded, color: Color(0xff1E3A4B),)),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(width: 4),
                    ),
                    TextSpan(
                        text: "Informasi: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts
                              .robotoCondensed()
                              .fontFamily,
                        )
                    ),
                  ]
              ),
            ),
            const SizedBox(height: 15),
            TableDetailDashboard(
                context,
                quizDetail.quizDate ?? '-',
                '$startTime - $endTime',
                '${endDateTime.difference(startDateTime).inMinutes} Menit',
                'Belum'
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WarningScreen()
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff3C6D8D)),
                child: Text(
                  'Mulai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/model/quiz.dart';
import 'package:semaga_mobile/view/reusable_widget/snack_popup.dart';

import '../../database/db_helper.dart';

class DetailQuiz extends StatefulWidget {

  final Data quizDetail;

  const DetailQuiz({super.key, required this.quizDetail});

  @override
  State<DetailQuiz> createState() => _DetailQuizState();
}

class _DetailQuizState extends State<DetailQuiz> {

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
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
        title: Text(widget.quizDetail.course?.toUpperCase() ?? '-',
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
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.quizDetail.title?.toUpperCase() ?? '-',
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
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xff4682A9)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [

                  ],
                ),
                Column(
                  children: [

                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await dbHelper.insertHistory({
                      'subject': widget.quizDetail.course,
                      'date': widget.quizDetail.quizDate,
                      'title': widget.quizDetail.title,
                      'startTime': widget.quizDetail.start,
                      'endTime': widget.quizDetail.end
                    });
                    ScaffoldMessenger.of(context).showSnackBar(Soyjoy('data berhasil disimpan'));
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff3C6D8D)),
                child: Text(
                  'Masuk',
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

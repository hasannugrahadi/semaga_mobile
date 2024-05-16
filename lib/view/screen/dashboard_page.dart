import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:semaga_mobile/view/utils/date_helper.dart';

import '../../model/quiz.dart';
import '../reusable_widget/quiz_card.dart';
import '../utils/date_in_bahasa.dart';

Padding DashboardBody(List<Data> quizzes,BuildContext context) {
  DateHelper dateHelper = DateHelper();
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jadwal hari ini',
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
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: SizedBox(width: 8),
                ),
                const WidgetSpan(child: Icon(
                  Icons.calendar_month, color: Color(0xff1E3A4B),)),
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: SizedBox(width: 4),
                ),
                TextSpan(
                    text: DateInBahasa.monthNameIndo[DateTime
                        .now()
                        .month - 1],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts
                          .robotoCondensed()
                          .fontFamily,
                    )
                ),
              ]
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getWeeklyDate()
              .asMap()
              .entries
              .map((entry) {
            int index = entry.key;
            String date = entry.value;
            return Container(
              height: 80,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xff4682A9),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateInBahasa.dayNameIndo[index],
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts
                            .robotoSlab()
                            .fontFamily,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      date,
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts
                            .robotoSlab()
                            .fontFamily,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    if(date == DateFormat('dd')
                        .format(DateTime.now())
                        .toString())
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF6F4EB),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: quizzes.isEmpty
              ? [
            const SizedBox(
              height: 60,
              child: Center(
                child: Text('Tidak ada ujian\nuntuk hari ini', textAlign: TextAlign.center,),
              ),
            )
          ] : quizzes.map((quiz) {
            DateTime timeQuiz = DateTime.parse(quiz.quizDate ?? '');
            if (dateHelper.isToday(timeQuiz)) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: QuizCards(quiz, context),
              );
            } else {
              return const SizedBox(
                height: 0
              );
            }
          }).toList(),
        ),
        const Divider(
          height: 45,
          thickness: 1.5,
          color: Color(0xff4682A9),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ujian yang akan datang',
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
            Container(
              width: 140,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff4682A9)),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              'Rentan:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: GoogleFonts
                                    .robotoCondensed()
                                    .fontFamily,
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: const Color(0xff4682A9),
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Text(
                              'Sebulan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: GoogleFonts
                                    .robotoCondensed()
                                    .fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          children: quizzes.isEmpty
              ? [
            const SizedBox(
              height: 60,
              child: Center(
                child: Text('Tidak ada ujian\nuntuk minggu ini', textAlign: TextAlign.center,),
              ),
            )
          ] : quizzes.map((quiz) {
            DateTime timeQuiz = DateTime.parse(quiz.quizDate ?? '');
            if (dateHelper.isWithinOneMonth(timeQuiz)) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: QuizCards(quiz, context),
              );
            } else {
              return const SizedBox(
                  height: 0
              );
            }
          }).toList(),
        ),
      ],
    ),
  );
}

List<String> getWeeklyDate() {
  DateTime now = DateTime.now();
  int currentDateDay = now.weekday;
  DateTime monday = now.subtract(Duration(days: currentDateDay - 1));
  List<String> datesForCurrentWeek = [];
  for (int i = 0; i < 7; i++) {
    DateTime currentDate = monday.add(Duration(days: i));
    String formattedDate = DateFormat('dd').format(currentDate);
    datesForCurrentWeek.add(formattedDate);
  }
  return datesForCurrentWeek;
}

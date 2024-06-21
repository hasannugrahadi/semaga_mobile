import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/screen/history_detail.dart';

GestureDetector QuizCardHistory(Map<String, dynamic> quiz  , context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HistoryDetail(quizDetail: quiz)
        ),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width-(110+15+15),
          height: 110,
          decoration: BoxDecoration(
            color: const Color(0xff4682A9),
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: quiz['subject'].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.robotoSlab().fontFamily,
                        ),
                      ),
                      const TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: quiz['date'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          fontFamily: GoogleFonts.robotoSlab().fontFamily,
                        ),
                      ),
                    ]
                  ),
                ),
                Text(
                  quiz['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    fontFamily: GoogleFonts.robotoSlab().fontFamily,
                  )
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: const Color(0xffF6F4EB),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/ic_checkmark.svg",
              fit: BoxFit.fill,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    ),
  );
}
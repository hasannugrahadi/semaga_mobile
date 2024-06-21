import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/reusable_widget/quiz_card_history.dart';

import '../utils/date_helper.dart';

Padding HistoryBody(List<Map<String, dynamic>> history, BuildContext context)  {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Riwayat Ujian',
                        style: TextStyle(
                          color: const Color(0xff1E3A4B),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: GoogleFonts
                              .robotoCondensed()
                              .fontFamily,
                        ),
                      ),
                      TextSpan(
                        text: '\ncek riwayat ujian mu',
                        style: TextStyle(
                          color: const Color(0xff1E3A4B),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontFamily: GoogleFonts
                              .robotoCondensed()
                              .fontFamily,
                        ),
                      ),
                    ]
                  )
              ),
              SizedBox(
                width: 175,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'cari',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: history.map((quiz) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: QuizCardHistory(quiz, context)
              );
            }).toList(),
          ),
        ],
      ),
    )
  );
}

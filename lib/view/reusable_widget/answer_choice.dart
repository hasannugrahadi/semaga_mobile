import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column AnswerChoice(BuildContext context, List<String> choices) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: choices.asMap().entries.map((entry) {

      int index = entry.key;
      String choice = entry.value;
      String choiceLabel = String.fromCharCode(65 + index);

      return GestureDetector(
        onTapDown: (details) {
          print("Someone is touchin' me !!");
        },
        onTapUp: (details) {
          print("I relaxed, oh.");
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xff4682A9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10,),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color(0xffFCFBF7), // Background color of the circle
                  shape: BoxShape.circle, // Shape of the container
                ),
                child: Center(
                  child: Text(
                    choiceLabel,
                    style: TextStyle(
                      color: const Color(0xff1E3A4B),
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                choice,
                style: TextStyle(
                  color: const Color(0xffFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

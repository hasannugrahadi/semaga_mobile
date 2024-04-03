import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/utils/methods.dart';

typedef DialogAction = void Function();

Dialog regularDialog(String text, image){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              width: 45,
              height: 45
          ),
          const SizedBox(
              height: 25
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff3C6D8D),
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          )
        ],
      ),
    ),
  );
}

Dialog confirmationDialog(String text, String image, DialogAction methodDialog){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              width: 45,
              height: 45
          ),
          const SizedBox(
              height: 25
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff3C6D8D),
              fontWeight: FontWeight.normal,
              fontSize: 16,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          const SizedBox(
              height: 25
          ),
          ElevatedButton(
              onPressed:(){
                methodDialog;
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(
                'HUBUNGI',
                style: TextStyle(
                  color: const Color(0xff3C6D8D),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              )
          ),
        ],
      ),
    ),
  );
}



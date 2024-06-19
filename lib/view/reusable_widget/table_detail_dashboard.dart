import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container TableDetailDashboard(BuildContext context, String date, String waktu, String waktuPengerjaan, String statusPengerjaan){
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(80, 145, 200, 228)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30,),
              Text(
                'Tanggal :                                ',
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts
                    .robotoCondensed()
                    .fontFamily,
                )
              ),
              Text(
                date,
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts
                    .robotoCondensed()
                    .fontFamily,
                )
              ),
            ]
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30,),
              Text(
                  'Waktu :                                   ',
                  style: TextStyle(
                    color: const Color(0xff1E3A4B),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts
                        .robotoCondensed()
                        .fontFamily,
                  )
              ),
              Text(
                  waktu,
                  style: TextStyle(
                    color: const Color(0xff1E3A4B),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts
                        .robotoCondensed()
                        .fontFamily,
                  )
              ),
            ]
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(80, 145, 200, 228)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30,),
              Text(
                'Waktu Pengerjaan :               ',
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts
                    .robotoCondensed()
                    .fontFamily,
                )
              ),
              Text(
                waktuPengerjaan,
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts
                    .robotoCondensed()
                    .fontFamily,
                )
              ),
            ]
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30,),
              Text(
                'Status Mengerjakan :            ',
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts
                      .robotoCondensed()
                      .fontFamily,
                )
              ),
              Text(
                statusPengerjaan,
                style: TextStyle(
                  color: const Color(0xff1E3A4B),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts
                      .robotoCondensed()
                      .fontFamily,
                )
              ),
            ]
          ),
        ),
      ],
    ),
  );
}
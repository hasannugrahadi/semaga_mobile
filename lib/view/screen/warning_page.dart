import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
         children: [
           Text(
             'P E R I N G A T A N',
             style: TextStyle(
               color: const Color(0xff4682A9),
               fontFamily: GoogleFonts.robotoCondensed().fontFamily
             ),
           ),
           SizedBox(

           ),
           Divider(

           ),
           SizedBox(

           )
         ],
        )
      ),
    );
  }
}

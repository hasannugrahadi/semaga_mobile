import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  State<QuizMain> createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                icon: const Icon(Icons.menu), iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }
            ),
          ),
          title: Text("Belum Selesai",
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
      body: const Placeholder()
    );
  }
}

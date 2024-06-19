import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'examplequiz_page.dart';

class SettingDetail extends StatefulWidget {
  const SettingDetail({super.key});

  @override
  State<SettingDetail> createState() => _SettingDetailState();
}

enum DateChoice {
  besok,
  seminggu,
  sebulan
}

class _SettingDetailState extends State<SettingDetail> {

  bool light = false;
  DateChoice? _choosenDate = DateChoice.seminggu;
  bool isWarningSkipped = false;
  double _currentSliderValue = 16;

  void _savePreferences(date_sort, ) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // prefs.setString('token', token);
    });
  }

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
        title: Text('P. APLIKASI',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(child: Icon(
                        Icons.settings_applications, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Umum',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Matikan laman peringatan',
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
                              text: '\nLaman peringatan akan otomatis terlewati.',
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
                  Switch(
                    value: light,
                    activeColor: const Color(0xff4682A9),
                    onChanged: (bool value) {
                      setState(() {
                        light = value;
                      });
                    },
                  )
                ],
              ),
              const Divider(
                height: 25,
                color: Color(0xff4682A9),
              ),
              RichText(
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ubah rentan waktu di beranda',
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
                          text: '\nRentan waktu ujian diubah di menu beranda.',
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
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Besok',
                      style: TextStyle(
                        color: const Color(0xff1E3A4B),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: GoogleFonts
                            .robotoCondensed()
                            .fontFamily,
                      ),
                    ),
                    leading: Radio<DateChoice>(
                      value: DateChoice.besok,
                      groupValue: _choosenDate,
                      onChanged: (DateChoice? value) {
                        setState(() {
                          _choosenDate = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Seminggu',
                      style: TextStyle(
                        color: const Color(0xff1E3A4B),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: GoogleFonts
                            .robotoCondensed()
                            .fontFamily,
                      ),
                    ),
                    leading: Radio<DateChoice>(
                      value: DateChoice.seminggu,
                      groupValue: _choosenDate,
                      onChanged: (DateChoice? value) {
                        setState(() {
                          _choosenDate = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Sebulan',
                      style: TextStyle(
                        color: const Color(0xff1E3A4B),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: GoogleFonts
                            .robotoCondensed()
                            .fontFamily,
                      ),
                    ),
                    leading: Radio<DateChoice>(
                      value: DateChoice.sebulan,
                      groupValue: _choosenDate,
                      onChanged: (DateChoice? value) {
                        setState(() {
                          _choosenDate = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 25,
                color: Color(0xff4682A9),
              ),
              const SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(child: Icon(
                        Icons.library_books_sharp, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Ujian',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ukuran font ujian',
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
                        text: '\nukuran font yang akan kamu pakai saat ujian',
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
                ),
              ),
              const SizedBox(height: 25,),
              Slider(
                value: _currentSliderValue,
                activeColor: const Color(0xff4682A9),
                max: 18,
                divisions: 2,
                min: 14,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aa',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts
                          .roboto()
                          .fontFamily,
                    ),
                  ),
                  Text(
                    'Aa',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts
                          .roboto()
                          .fontFamily,
                    ),
                  ),
                  Text(
                    'Aa',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts
                          .roboto()
                          .fontFamily,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 25,
                color: Color(0xff4682A9),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExampleQuizPage()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Color(0xff4682A9), width: 2),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xffFFFFFF)
                  ),
                  child: Text(
                    'Preview Soal',
                    style: TextStyle(
                      color: const Color(0xff4682A9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

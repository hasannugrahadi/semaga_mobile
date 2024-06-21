import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/screen/quiz_main.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'P E R I N G A T A N',
                    style: TextStyle(
                      color: const Color(0xff4682A9),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                    ),
                ),
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff4682A9),
                      width: 1.0,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Kamu akan mengerjakan ujian ini. '
                            'Pastikan koneksi internetmu dalam keadaan stabil. '
                            'Kamu tidak dapat kembali setelah membuka soal ujian. '
                            'Keluar dari aplikasi ini saat ujian dapat mengakibatkan kamu '
                            'tidak dapat mengakses ujiannya lagi. '
                            'Notifikasi mu akan di snooze sampai ujianmu selesai. '
                            'Waktu ujian dimulai saat kamu masuk ujian.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ),
                const Divider(
                  thickness: 1,
                  height: 25,
                  color: Color(0xff4682A9),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizMain()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        foregroundColor: const Color(0xffFFFFFF),
                        backgroundColor: const Color(0xff3C6D8D)),
                    child: Text(
                      'Masuk Ujian',
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
        ),
      )
    );
  }
}

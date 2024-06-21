import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/reusable_widget/answer_choice.dart';

class ExampleQuizPage extends StatefulWidget {
  const ExampleQuizPage({super.key});

  @override
  State<ExampleQuizPage> createState() => _ExampleQuizPageState();
}

class _ExampleQuizPageState extends State<ExampleQuizPage> {

  bool? _isChecked = false;

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
        titleSpacing: 0.0,
        backgroundColor: const Color(0xff4682A9),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xff4682A9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '10',
                          style: TextStyle(
                            color: const Color(0xffFFFFFF),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Checkbox(
                      activeColor: const Color(0xff4682A9),
                      value: _isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          _isChecked = newBool!;
                        });
                      },
                    ),
                    Text(
                      'Tandai Soal',
                      style: TextStyle(
                        color: const Color(0xff4682A9),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts
                            .robotoCondensed()
                            .fontFamily,
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SingleChildScrollView(
                      child: Html(
                        data: '''<p>Dalam biologi, sel adalah kumpulan materi paling sederhana yang
                        dapat hidup dan merupakan unit penyusun semua makhluk hidup.[1][2] Sel
                        mampu melakukan semua aktivitas kehidupan dan sebagian besar reaksi kimia untuk
                        mempertahankan kehidupan
                        berlangsung di dalam sel.[3][4]Organisme dapat berupa
                        organisme uniseluler (tersusun atas sel tunggal),[5] misalnya
                        bakteri dan amoeba dan organisme multiseluler, termasuk tumbuhan,
                        hewan, dan manusia. Organisme multiseluler terdiri dari banyak tipe sel
                        terspesialisasi dengan fungsinya masing-masing.[1] Tubuh manusia tersusun atas
                        lebih dari 10<sup>13</sup> sel.[5] Namun, seluruh tubuh semua organisme berasal
                        dari hasil pembelahan satu sel. Contohnya, tubuh bakteri berasal dari pembelahan
                        sel bakteri induknya, sementara tubuh tikus berasal dari pembelahan sel telur
                        induknya yang sudah dibuahi.Sel-sel pada organisme multiseluler tidak akan bertahan l
                        ama jika masing-masing berdiri sendiri.[1] Sel yang sama dikelompokkan menjadi
                        jaringan, yang membangun organ dan kemudian sistem organ yang membentuk tubuh
                        organisme tersebut. Contohnya, sel otot jantung membentuk jaringan otot jantung
                        pada organ jantung yang merupakan bagian dari sistem organ peredaran darah pada
                        tubuh manusia. Sementara itu, sel sendiri tersusun atas komponen-komponen yang disebut organel.
                        [6]Sel terkecil yang dikenal manusia ialah bakteri Mycoplasma dengan diamete r
                        </p>
                        ''',
                        style: {
                          "p": Style(
                            fontSize: FontSize(14),
                            textAlign: TextAlign.justify,
                          ),
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 275,
                    child: AnswerChoice(context, ["Politeknik Negeri Jember", "Politeknik Negeri Malang", "Politeknik Negeri Sriwijaya", "Politeknik Negeri Bandung", "Politeknik Negeri Jakarta"])
                ),
              ],
            ),
          ),
          GestureDetector(
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    color: Color(0xff4682A9)
                ),
              ),
            ),
            onTap: (){
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height/2.4,
                    width: MediaQuery.of(context).size.width,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          color: Color(0xff4682A9)
                      ),
                    ),
                  );
                }
              );
            },
          )
        ],
      ),
    );
  }
}

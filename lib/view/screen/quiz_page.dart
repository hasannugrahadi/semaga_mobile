import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusable_widget/answer_choice.dart';

 class QuizPage extends StatefulWidget {
   const QuizPage({super.key});

   @override
   State<QuizPage> createState() => _QuizPageState();
 }

 class _QuizPageState extends State<QuizPage> {
   @override
   Widget build(BuildContext context) {
     bool? isChecked = false;
     return Padding(
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
                   borderRadius: BorderRadius.circular(5), // Adjust the radius value as needed
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
                 value: isChecked,
                 onChanged: (newBool) {
                   setState(() {
                     isChecked = newBool!;
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
             height: MediaQuery.of(context).size.height/2.5,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6),
               border: Border.all(
                 color: Colors.black,
                 width: 1.0,
               ),
             ),
             child: const Padding(
               padding: EdgeInsets.all(5.0),
               child: SingleChildScrollView(
                 child: Text(
                   'Dalam biologi, sel adalah kumpulan materi paling sederhana yang dapat hidup dan merupakan unit penyusun semua makhluk hidup.[1][2] Sel mampu melakukan semua aktivitas kehidupan dan sebagian besar reaksi kimia untuk mempertahankan kehidupan berlangsung di dalam sel.[3][4]Organisme dapat berupa organisme uniseluler (tersusun atas sel tunggal),[5] misalnya bakteri dan amoeba dan organisme multiseluler, termasuk tumbuhan, hewan, dan manusia. Organisme multiseluler terdiri dari banyak tipe sel terspesialisasi dengan fungsinya masing-masing.[1] Tubuh manusia tersusun atas lebih dari 1013 sel.[5] Namun, seluruh tubuh semua organisme berasal dari hasil pembelahan satu sel. Contohnya, tubuh bakteri berasal dari pembelahan sel bakteri induknya, sementara tubuh tikus berasal dari pembelahan sel telur induknya yang sudah dibuahi.Sel-sel pada organisme multiseluler tidak akan bertahan lama jika masing-masing berdiri sendiri.[1] Sel yang sama dikelompokkan menjadi jaringan, yang membangun organ dan kemudian sistem organ yang membentuk tubuh organisme tersebut. Contohnya, sel otot jantung membentuk jaringan otot jantung pada organ jantung yang merupakan bagian dari sistem organ peredaran darah pada tubuh manusia. Sementara itu, sel sendiri tersusun atas komponen-komponen yang disebut organel.[6]Sel terkecil yang dikenal manusia ialah bakteri Mycoplasma dengan diameter',
                   textAlign: TextAlign.justify,
                 ),
               ),
             ),
           ),
           const SizedBox(height: 15,),
           SizedBox(
               height: 300,
               child: AnswerChoice(context, [])
           ),
         ],
       ),
     );
   }
 }

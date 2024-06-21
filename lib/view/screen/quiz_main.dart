import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/reusable_widget/countdown_timer.dart';
import 'package:semaga_mobile/view/screen/quiz_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  State<QuizMain> createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {

  String _studentName = '-';
  String _studentGrade = '-';

  void _loadData() async {
    // await _quizViewModel.fetchQuiz(widget.tokenUser);
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // quizzesDataUnsorted = _quizViewModel.quizzes;
      _studentName = prefs.getString('name') ?? '';
      _studentGrade = prefs.getString('grade') ?? '';

      // sortQuizByDate(quizzesDataUnsorted);
    });
  }

  void _sendData() async{

  }

  void _timesUp() {
    Duration(
      seconds: 10

    );
    SystemNavigator.pop();
  }

  String _trimString(String input) {
    if (input.length <= 15){
      return input;
    } else {
      int lastSpaceIndex = input.lastIndexOf(' ', 15);
      String trimmedWords = input.substring(lastSpaceIndex, input.length);
      String remainWords = input.substring(0, lastSpaceIndex);
      String firstAbbreviation = "${trimmedWords[1]}.";
      return "$remainWords $firstAbbreviation";
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      Text(
                        _trimString(_studentName),
                      ),
                      Text(
                        _studentGrade,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(99))
                  ),
                  child: Center(
                    child: CountDownTimer(
                      secondsRemaining: 120,
                      whenTimeExpires: _timesUp,
                      countDownTimerStyle: TextStyle(
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          titleSpacing: 0.0,
          backgroundColor: const Color(0xff4682A9),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const QuizPage(),
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

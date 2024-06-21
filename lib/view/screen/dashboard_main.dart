import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:semaga_mobile/model/quiz.dart';
import '../../database/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view_model/quiz_view_model.dart';
import '../reusable_widget/snack_popup.dart';
import 'dashboard_page.dart';
import 'history_page.dart';
import 'setting_page.dart';


class DashboardMain extends StatefulWidget {

  final String tokenUser;

  const DashboardMain({super.key, required this.tokenUser});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {

  final DatabaseHelper dbHelper = DatabaseHelper();
  final QuizViewModel _quizViewModel = QuizViewModel();

  int _selectedBodyIndex = 0;

  bool isLoading = true;

  late List<Data> quizzesDataUnsorted = [];
  late List<Data> quizzesDataToday = [];
  late List<Map<String, dynamic>> history = [];
  late List beforeUnsortedIndex = [];
  late List beforeUnsortedIndexToday = [];

  String _studentName = '-';
  String _studentNis = '-';
  String _studentGrade = '-';

  final List<String> _appBarTitles = [
    'BERANDA',
    'RIWAYAT',
    'PENGATURAN',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedBodyIndex = index;
    });
  }

  void sortQuizByDate(List<Data> unsortedQuizzes) {
    List<Data> toRemove = [];

    for (var element in unsortedQuizzes) {
      if (element.quizDate == DateFormat('yyyy-MM-dd').format(DateTime.now())) {
        beforeUnsortedIndexToday.add(unsortedQuizzes.indexOf(element));
        quizzesDataToday.add(element);
        toRemove.add(element);
      } else {
        beforeUnsortedIndex.add(unsortedQuizzes.indexOf(element));
      }
    }

    for (var element in toRemove) {
      quizzesDataUnsorted.remove(element);
    }
  }

  void _loadData() async {
    await _quizViewModel.fetchQuiz(widget.tokenUser);
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      quizzesDataUnsorted = _quizViewModel.quizzes;
      _studentName = prefs.getString('name') ?? '';
      _studentNis = prefs.getString('nis') ?? '';
      _studentGrade = prefs.getString('grade') ?? '';
      sortQuizByDate(quizzesDataUnsorted);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  List<String> getWeeklyDate() {
    DateTime now = DateTime.now();
    int currentDateDay = now.weekday;
    DateTime monday = now.subtract(Duration(days: currentDateDay - 1));
    List<String> datesForCurrentWeek = [];
    for (int i = 0; i < 7; i++) {
      DateTime currentDate = monday.add(Duration(days: i));
      String formattedDate = DateFormat('dd').format(currentDate);
      datesForCurrentWeek.add(formattedDate);
    }
    return datesForCurrentWeek;
  }

  Future<void> _handleRefresh() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        quizzesDataUnsorted.clear();
        quizzesDataToday.clear();
        _loadData();
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Soyjoy('galat memuat data'));
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      DashboardBody(quizzesDataUnsorted, quizzesDataToday, beforeUnsortedIndex, beforeUnsortedIndexToday, isLoading, context),
      HistoryBody(history ,context),
      SettingBody(_studentName, _studentNis, _studentGrade, context),
    ];

    return PopScope(
      canPop: false,
      onPopInvoked : (didPop) async {
        final shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Keluar'),
            content: Text('Apakah kamu ingin keluar aplikasi?',
              style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontFamily: GoogleFonts.robotoCondensed().fontFamily,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Tidak',
                  style: TextStyle(
                    color: const Color(0xff4682A9),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Ya',
                  style: TextStyle(
                    color: const Color(0xff4682A9),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        );
        if (shouldExit) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
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
          title: Text(_appBarTitles[_selectedBodyIndex],
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
        drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xff4682A9),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          'assets/images/ic_face_dashboard.svg',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50
                      ),
                      const SizedBox(height: 10),
                      Text(_studentName,
                        style:
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                        ),
                      ),
                      Text(_studentNis,
                        style:
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Beranda'),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('Riwayat'),
                onTap: () async {
                  history = await dbHelper.getHistory();
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Pengaturan'),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 150,
              ),
              const Divider(
                height: 25,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
                color: Color(0xff4682A9),
              ),
              ListTile(
                leading: const Icon(Icons.door_back_door),
                title: const Text('Keluar Akun'),
                onTap: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  DatabaseHelper databaseHelper = DatabaseHelper();
                  await databaseHelper.deleteAllHistories();
                  await prefs.clear();
                  exit(0);
                },
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          color: Colors.white,
          backgroundColor: const Color(0xff4682A9),
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: pages[_selectedBodyIndex]
          )
        )
      ),
    );
  }
}



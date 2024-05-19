import 'dart:io';

import 'package:flutter/material.dart';
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

  late List<Data> quizzesData = [];
  late List<Map<String, dynamic>> history = [];

  String _studentName = '-';
  String _studentNis = '-';

  final List<String> _appBarTitles = [
    'BERANDA',
    'RIWAYAT',
    'PENGATURAN',
  ];

  void _loadData() async {
    await _quizViewModel.fetchQuiz(widget.tokenUser);
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      quizzesData = _quizViewModel.quizzes;
      _studentName = prefs.getString('name') ?? '';
      _studentNis = prefs.getString('nis') ?? '';
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedBodyIndex = index;
    });
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

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      DashboardBody(quizzesData ,context),
      HistoryBody(history ,context),
      SettingBody(_studentName, _studentNis,context),
    ];

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
        backgroundColor: Colors.blue,
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: pages[_selectedBodyIndex]
        )
      )
    );
  }

  Future<void> _handleRefresh() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _loadData();
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Soyjoy('error ngeload data: $e'));
    }
  }
}



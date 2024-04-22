import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  List<String> getWeeklyDate() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;
    DateTime monday = now.subtract(Duration(days: currentWeekday - 1));
    List<String> datesForCurrentWeek = [];
    for (int i = 0; i < 7; i++) {
      DateTime currentDate = monday.add(Duration(days: i));
      String formattedDate = DateFormat('dd').format(currentDate);
      datesForCurrentWeek.add(formattedDate);
    }
    return datesForCurrentWeek;
  }

  static const weekNameIndo = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), iconSize: 30,
            color: Colors.white,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('DASBOR',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Riwayat'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jadwal hari ini',
                style:
                TextStyle(
                  color: Color(0xff1E3A4B),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                ),
              ),
              const SizedBox(height: 5),
              Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      const WidgetSpan(child: Icon(Icons.calendar_month, color: Color(0xff1E3A4B))),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 4),
                      ),
                      TextSpan(
                          text : DateFormat('MMMM').format(DateTime.now()),
                          style: const TextStyle(fontSize: 18)
                      ),
                    ]
                  ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getWeeklyDate().asMap().entries.map((entry) {
                  int index = entry.key;
                  String date = entry.value;
                  return Container(
                    height: 80,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xff4682A9),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          weekNameIndo[index],
                          style:
                          TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            fontFamily: GoogleFonts.robotoSlab().fontFamily,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          date,
                        style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                              fontFamily: GoogleFonts.robotoSlab().fontFamily,
                            ),
                          ),
                        const SizedBox(
                          height: 2,
                        ),
                        if(date == DateFormat('dd').format(DateTime.now()).toString())
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF6F4EB),
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      )
    );
  }
}



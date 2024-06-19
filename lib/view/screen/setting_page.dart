import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/screen/changepassword_page.dart';
import 'package:semaga_mobile/view/screen/setting_detail.dart';

Padding SettingBody(String name, String nis, String grade, BuildContext context){
  return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/6,
            decoration: BoxDecoration(
              color: const Color(0xff1E3A4B),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_logo_profile.svg'
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                          ),
                        ),
                        Text(
                          '$nis | $grade',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingDetail()
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      const WidgetSpan(child: Icon(
                        Icons.settings, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Pengaturan aplikasi',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
            ),
          ),
          const Divider(
            height: 45,
            indent: 10,
            endIndent: 10,
            thickness: 1,
            color: Color(0xff4682A9),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage()
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      const WidgetSpan(child: Icon(
                        Icons.lock_reset, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Ubah password',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
            ),
          ),
          const Divider(
            height: 45,
            indent: 10,
            endIndent: 10,
            thickness: 1,
            color: Color(0xff4682A9),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingDetail()
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      const WidgetSpan(child: Icon(
                        Icons.call, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Hubungi admin',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 45,
            indent: 10,
            endIndent: 10,
            color: Color(0xff4682A9),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingDetail()
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      const WidgetSpan(child: Icon(
                        Icons.door_back_door_outlined, color: Color(0xff1E3A4B),)),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                          text: 'Keluar akun',
                          style: TextStyle(
                            color: const Color(0xff1E3A4B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts
                                .robotoCondensed()
                                .fontFamily,
                          )
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
  );
}

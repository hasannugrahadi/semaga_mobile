import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semaga_mobile/view/screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String _token = '';

  void _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? '';
      print(_token);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
    Timer(
      const Duration(seconds: 3), () {
        Navigator.of(context).push(_createRoute(_token));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/bg_splashscreen.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity
          ),
          Center(
            child: Image.asset(
              'assets/images/Group.png',
              width: 150,
              height: 150
            )
          ),
        ],
      ),
    );
  }
}

Route _createRoute(String token) {
  if (token.isEmpty) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  } else {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DashboardMain(tokenUser: token),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


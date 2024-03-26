import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semaga_mobile/pages/login_page.dart';

import '../models/users.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(_createRoute());
    });
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

Route _createRoute() {
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
}


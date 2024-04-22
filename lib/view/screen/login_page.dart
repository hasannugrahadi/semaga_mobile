import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/reusable_widget/dialogs.dart';
import '../../models/login.dart';
import '../../view_model/login_view_model.dart';

import 'dashboard_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Future<Login> futureLogin;

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, don't unfocused
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_up_login.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/Group.png', width: 90, height: 90),
              const SizedBox(height: 20.0),
              Text(
                'SISTEM UJIAN\nSMA NEGERI 3 JEMBER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nisController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff3C6D8D), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Masukkan NIS',
                  hintStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 195, 195, 195),
                      fontStyle: FontStyle.italic),
                  prefixIcon: const Icon(Icons.credit_card_rounded),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff3C6D8D), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Masukkan password',
                  hintStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 195, 195, 195),
                      fontStyle: FontStyle.italic),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
                            ? Icons.visibility_off
                            : Icons.visibility_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String nis = _nisController.text;
                    String password = _passwordController.text;
                    if (nis.isNotEmpty && password.isNotEmpty) {
                     LoginViewModel().fetchLogin(nis, password).then((data){
                       if (data.access_token.isNotEmpty) {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => const DashboardPage()
                           ),
                         );
                       } else {
                         showDialog(
                           context: context,
                           builder: (BuildContext context) {
                             return regularDialog(
                                 "NIS atau password\nkamu salah, coba lagi",
                                 "assets/images/ic_warning_triangle.svg");
                           },
                         );
                       }
                     });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return regularDialog(
                              "Mohon masukkan\nNIS dan password kamu",
                              "assets/images/ic_warning_triangle.svg");
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      foregroundColor: const Color(0xffFFFFFF),
                      backgroundColor: const Color(0xff3C6D8D)),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: ''),
                      TextSpan(
                          text: 'Butuh bantuan?',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffA3C0D4),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return confirmationDialogWA(
                                      "Apakah kamu ingin menghubungi\nadmin melalui WhatsApp?",
                                      "assets/images/ic_warning_triangle.svg");
                                },
                              );
                            })
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Center(
          child: Image.asset('assets/images/logo_school.png',
              fit: BoxFit.contain, width: 200),
        )
      ]),
    );
  }
}

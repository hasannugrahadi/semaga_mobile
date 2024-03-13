import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/pages/dashboard_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, don't unfocused
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children:
      [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_up_login.png'),
                fit: BoxFit.cover,
              ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/Group.png',
                    width: 90,
                    height: 90
                ),
                const SizedBox(
                    height: 20.0
                ),
                Text(
                  'SISTEM UJIAN\nSMA NEGERI 3 JEMBER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 250, 35, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'masukkan NIS',
                  hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                  prefixIcon: const Icon(Icons.credit_card_rounded),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
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
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  if (username == '12345' && password == 'hasan'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  } else {
                    const snackBar = SnackBar(
                      content: Text('nis atau password salah'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 197, vertical: 24),
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff3C6D8D)
                ),
                child: const Text('Login'),
              ),
              const SizedBox(
                  height: 80.0
              ),
            ],
          ),
        )
      ]
    ),
  );
}

}
// Row signup() {
//   return Row(
//     MainAxisAlignment: MainAxisAlignment.center,
//     children: [const Text("Tidak Punya akun?")],
//   );
// }

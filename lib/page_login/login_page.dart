import 'package:flutter/material.dart';
import 'package:semaga_mobile/utils/colos.dart';
import 'package:semaga_mobile/reusable_widget/reusable_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringColor("FF7D00"),
            hexStringColor("FFA500"),
            hexStringColor("FFD700")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "SEMAGA",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily:
                        'Lobster', // Gantilah dengan nama font yang diinginkan
                    fontWeight: FontWeight.bold,
                    // Anda juga dapat menambahkan properti lain sesuai kebutuhan desain Anda
                  ),
                ),
                logoWidget("assets/images/books.png"),
                SizedBox(height: 30),
                reusabletextfield("Email...", Icons.person_3_rounded, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusabletextfield("Password...", Icons.lock_outline, true,
                    _passwordtextController),
                SizedBox(
                  height: 20,
                ),
                signsignup(context, true, () {})
                // signsignupgoogle(context, true, () {})
              ],
            ),
          ),
        ),
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

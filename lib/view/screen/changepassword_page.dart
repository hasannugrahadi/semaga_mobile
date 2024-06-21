import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semaga_mobile/view/screen/examplequiz_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final TextEditingController _passwordlamaController = TextEditingController();
  final TextEditingController _passwordbaruController = TextEditingController();
  final TextEditingController _passwordkonfirmasiController = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, don't unfocused
      }
      textFieldFocusNode.canRequestFocus = false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back), iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
        ),
        title: Text('UBAH PASSWORD',
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
      body: Padding(
        padding:const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                    'assets/images/art_changepassword.svg',
                  width: 150,
                  height: 150,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                      'Jaga akunmu tetap aman',
                      style: TextStyle(
                        color: const Color(0xff1E3A4B),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts
                          .robotoCondensed()
                          .fontFamily,
                      )
                    ),
                    Text(
                      'Akunmu dapat dibobol\nkapan saja oleh\norang tidak bertanggung jawab',
                      style: TextStyle(
                        color: const Color(0xff1E3A4B),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: GoogleFonts
                          .robotoCondensed()
                          .fontFamily,
                      )
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordlamaController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff3C6D8D), width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(5.0)
                ),
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
            const SizedBox(height: 20,),
            TextField(
              controller: _passwordbaruController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff3C6D8D), width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(5.0)
                ),
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
            const SizedBox(height: 20,),
            TextField(
              controller: _passwordkonfirmasiController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff3C6D8D), width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(5.0)
                ),
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
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff3C6D8D)),
                child: Text(
                  'Ubah Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

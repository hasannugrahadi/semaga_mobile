import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //controller & string
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late String dropdownGender = 'laki-laki';
  late String dropdownReligion = 'Islam';

  //list dropdown
  var itemsGender = [
    'laki-laki',
    'perempuan'
  ];

  var itemsReligion = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghuchu'
  ];

  //focus password icon
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
    TextStyle textfieldStyle = const TextStyle(color: Colors.black, fontSize: 14.0);
    return Scaffold(
      body: Padding( //padding antar elemen
        padding: const EdgeInsets.fromLTRB(35, 35, 35, 10),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            Text(
              'Registrasi',
              style: TextStyle(
                color: const Color(0xff3C6D8D),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: GoogleFonts.robotoCondensed().fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _fullnameController,
              style: textfieldStyle,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
              ],
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'masukkan nama panjang mu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.face),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            TextField(
              controller: _usernameController,
              style: textfieldStyle,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
              ],
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'masukkan username mu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.person),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            TextField(
              controller: _emailController,
              style: textfieldStyle,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(" ")),
              ],
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'masukkan email mu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.email),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            TextField(
              controller: _nohpController,
              style: textfieldStyle,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'masukkan no hp. mu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.phone),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              style: textfieldStyle,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'Masukkan password',
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
            TextField(
              controller: _confirmpasswordController,
              keyboardType: TextInputType.visiblePassword,
              style: textfieldStyle,
              obscureText: _obscured,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'Konfirmasi password mu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.lock_outline),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis Kelamin:',
                  style: TextStyle(
                    color: const Color(0xff3C6D8D),
                    fontSize: 14,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                  textAlign: TextAlign.left,
                ),
                DropdownButton(
                  style: textfieldStyle,
                  // Initial Value
                  value: dropdownGender,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: itemsGender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownGender = newValue!;
                    });
                  },
                ),
                Text(
                  'Agama:',
                  style: TextStyle(
                    color: const Color(0xff3C6D8D),
                    fontSize: 14,
                    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                  ),
                  textAlign: TextAlign.left,
                ),
                DropdownButton(
                  style: textfieldStyle,
                  // Initial Value
                  value: dropdownReligion,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: itemsReligion.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownReligion = newValue!;
                    });
                  },
                ),
              ],
            ),
            TextField(
              controller: _addressController,
              style: textfieldStyle,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff3C6D8D), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'masukkan alamat lengkapmu',
                hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                prefixIcon: const Icon(Icons.pin_drop),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String fullname = _fullnameController.text;
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String nohp = _nohpController.text;
                  String password = _passwordController.text;
                  String confirmpassword = _confirmpasswordController.text;
                  String address = _addressController.text;

                  if (fullname.isNotEmpty &&
                      username.isNotEmpty &&
                      email.isNotEmpty &&
                      nohp.isNotEmpty &&
                      password.isNotEmpty &&
                      confirmpassword.isNotEmpty &&
                      address.isNotEmpty &&
                      password == confirmpassword){
                    const snackBar = SnackBar(
                      content: Text('Registrasi Berhasil'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  } else if (password != confirmpassword){
                    const snackBar = SnackBar(
                      content: Text('konfirmasi password tidak cocok'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    const snackBar = SnackBar(
                      content: Text('harap isi semua kolom yang ada'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.34),
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff3C6D8D)
                ),
                child: const Text('Register'),
              ),
            )
          ],
        )
      ),
    );
  }
}
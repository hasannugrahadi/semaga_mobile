import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:semaga_mobile/models/users.dart';
import 'package:semaga_mobile/pages/dashboard_page.dart';

import 'login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  final _user = User('', '', '', '', '', '');

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
  bool _obscuredPassword = true;
  bool _obscuredConfirmation = true;

  void _toggleObscuredPassword() {
    setState(() {
      _obscuredPassword = !_obscuredPassword;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, don't unfocused
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  void _toggleObscuredConfirmation() {
    setState(() {
      _obscuredConfirmation = !_obscuredConfirmation;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, don't unfocused
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textfieldStyle = const TextStyle(color: Colors.black, fontSize: 14.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
            child: Form(
                key: _formKey,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  TextFormField(
                    controller: _fullnameController,
                    style: textfieldStyle,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'masukkan nama panjang mu',
                      hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: Icon(Icons.face),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.fullname = value!,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    style: textfieldStyle,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'masukkan username mu',
                      hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.username = value!,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: textfieldStyle,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(" ")),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'masukkan email mu',
                      hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      } else if (!value.contains('@')) {
                        return 'Email tidak sesuai';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.email = value!,
                  ),
                  TextFormField(
                    controller: _nohpController,
                    style: textfieldStyle,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'masukkan no hp. mu',
                      hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: Icon(Icons.phone),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      } else if (value.length < 11) {
                        return 'No HP tidak sesuai';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.nohp = value!,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscuredPassword,
                    focusNode: textFieldFocusNode,
                    style: textfieldStyle,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password',
                      hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscuredPassword,
                          child: Icon(
                            _obscuredPassword
                                ? Icons.visibility_off
                                : Icons.visibility_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.password = value!,
                  ),
                  TextFormField(
                    controller: _confirmpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    style: textfieldStyle,
                    obscureText: _obscuredConfirmation,
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi password mu',
                      hintStyle: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscuredConfirmation,
                          child: Icon(
                            _obscuredConfirmation
                                ? Icons.visibility_off
                                : Icons.visibility_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      } else if (value != _passwordController.text){
                        return 'Password tidak sesuai';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Jenis Kelamin:    ',
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
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownGender = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Agama:                ',
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
                  TextFormField(
                    controller: _addressController,
                    style: textfieldStyle,
                    decoration: const InputDecoration(
                      hintText: 'masukkan alamat lengkapmu',
                      hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 195, 195, 195)),
                      prefixIcon: Icon(Icons.pin_drop),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong isi kolom ini';
                      }
                      return null;
                    },
                    // onSaved: (value) => _user.address = value!,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          const snackBar = SnackBar(
                            content: Text('Registrasi Berhasil'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // _formKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardPage(user: _user),
                            ),
                          );
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
        ),
      ),
    );
  }
}
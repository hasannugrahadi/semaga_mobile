import 'package:flutter/material.dart';

SnackBar Soyjoy(String text){
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 3)
  );
}
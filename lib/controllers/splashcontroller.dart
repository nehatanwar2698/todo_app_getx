import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/view/homescreen/home_screen.dart';

class SplashController {
  void isLogin(context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
}

import 'package:flutter/material.dart';

import '../../controllers/splashcontroller.dart';
import '../../res/colors/app_colors.dart';
import '../../utility/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SplashController().isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
            child: Text(
          "Welcome",
          style: Utils.setFontStyle(color: Colors.white, fontSize: 24),
        )),
      ),
    );
  }
}

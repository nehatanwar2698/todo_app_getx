import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/view/homescreen/home_screen.dart';
import 'package:todo_app/view/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 14),
          )),
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stop_watch/screens/home_page.dart';
import 'package:stop_watch/screens/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Set this to false
      home: SplashScreen(),
    );
  }
}


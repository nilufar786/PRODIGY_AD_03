import 'package:flutter/material.dart';
import 'dart:async';

import 'package:stop_watch/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() {
    Timer(Duration(seconds: 5), () {
      // Replace 'MyHomePage()' with the actual name of your main app widget.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMovingText(),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/icons8-stopwatch-64.png', // Replace with the actual image path
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }

  Widget _buildMovingText() {
    return TweenAnimationBuilder<double>(
      duration: Duration(seconds: 5),
      tween: Tween<double>(begin: -1.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * 200, 0),
          child: Text(
            'Stop Watch',
            style: TextStyle(fontSize: 40.0,color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

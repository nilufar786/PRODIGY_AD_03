import 'package:flutter/material.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // title: Center(child: Text('Stopwatch App')),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25.0),
            _buildMovingText(),
            SizedBox(height: 25.0),
            Image.asset(
              'assets/icons8-stopwatch-64.png', // Replace with the actual image path
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 20.0),

            Container(
              height: 150,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                border: Border.all(
                  color: Colors.lightBlueAccent
                ),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  _buildTimeDisplay(),
                  SizedBox(height: 20.0),
                  _buildControlButtons(),
                ],
              ),
            ),

            Image.asset(
              'assets/icons8-grinning-face-with-big-eyes-64.png',
              width: 100.0,
              height: 100.0,
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildTimeDisplay() {
    return Text(
      _formatTime(_stopwatch.elapsedMilliseconds),
      style: TextStyle(fontSize: 48.0),
    );
  }

  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _toggleStartPause,
          child: Text(_isRunning ? 'Pause' : 'Start'),
        ),
        SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: _reset,
          child: Text('Reset'),
        ),
      ],
    );
  }

  void _toggleStartPause() {
    setState(() {
      if (_isRunning) {
        _stopwatch.stop();
        _timer?.cancel();
      } else {
        _stopwatch.start();
        _timer = Timer.periodic(Duration(milliseconds: 100), _updateTime);
      }
      _isRunning = !_isRunning;
    });
  }

  void _reset() {
    setState(() {
      _stopwatch.reset();
      _timer?.cancel();
      _isRunning = false;
    });
  }

  void _updateTime(Timer timer) {
    if (_isRunning) {
      setState(() {
        // Trigger a rebuild every 100 milliseconds
      });
    }
  }
  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).floor();
    int minutes = (seconds / 60).floor();
    int hours = (minutes / 60).floor();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String millisecondsStr = (milliseconds % 1000 ~/ 10).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr:$millisecondsStr' ?? '';
  }

  Widget _buildMovingText() {
    return TweenAnimationBuilder<double>(
      duration: Duration(seconds: 5),
      tween: Tween<double>(begin: 1, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * 200, 0),
          child: Text(
            'Stop Watch',
            style: TextStyle(fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

}
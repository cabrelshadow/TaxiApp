import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (timer) => setState(
            () {
          if (_secondsRemaining < 1) {
            timer.cancel();
          } else {
            _secondsRemaining -= 1;
          }
        },
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds - (minutes * 60);
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Renvoyer le code dans :",style: GoogleFonts.roboto(),),
        SizedBox(width: 10,),
        Text(_formatTime(_secondsRemaining),style: GoogleFonts.roboto(fontWeight: FontWeight.bold),),
      ],
    );
  }
}

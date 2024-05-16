import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

class ReverseTimerWidget extends StatefulWidget {
  @override
  _ReverseTimerWidgetState createState() => _ReverseTimerWidgetState();
}

class _ReverseTimerWidgetState extends State<ReverseTimerWidget> {
  late ReverseTimer _reverseTimer;
  int _remainingTime = 0;
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _reverseTimer = ReverseTimer(
      durationInSeconds: 0, // Initial duration set to 0
      onTick: (remainingTime) {
        setState(() {
          _remainingTime = remainingTime;
        });
      },
      onTimerFinished: () {
        setState(() {
          _remainingTime = 0;
          _isTimerRunning = false;
          // Handle timer finished event here
        });
      },
    );
  }

  @override
  void dispose() {
    _reverseTimer.stopTimer();
    super.dispose();
  }

  void _startTimer() {
    int hours = int.tryParse(_hoursController.text) ?? 0;
    int minutes = int.tryParse(_minutesController.text) ?? 0;
    int seconds = int.tryParse(_secondsController.text) ?? 0;
    int totalSeconds = (hours * 3600) + (minutes * 60) + seconds;

    if (totalSeconds > 0) {
      _reverseTimer.durationInSeconds = totalSeconds;
      _reverseTimer.startTimer();
      _isTimerRunning = true;
    }
  }

  void _stopTimer() {
    _reverseTimer.stopTimer();
    _isTimerRunning = false;
  }

  void _resetTimer() {
    _hoursController.clear();
    _minutesController.clear();
    _secondsController.clear();
    _reverseTimer.stopTimer();
    setState(() {
      _remainingTime = 0;
      _isTimerRunning = false;
    });
  }

  String _formatTime(int time) {
    int hours = time ~/ 3600;
    int minutes = (time % 3600) ~/ 60;
    int seconds = time % 60;
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatTime(_remainingTime);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Timer',style: GoogleFonts.aBeeZee(textStyle:const TextStyle(fontSize: 35,color: Colors.white)),),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg.jpg',)
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedTime,
                style: GoogleFonts.wallpoet(textStyle:
                const TextStyle(fontSize: 50,color: Colors.white,),),
              ),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: TextField(
                      controller: _hoursController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Hours',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade700),borderRadius: BorderRadius.circular(10)),
                        focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: TextField(
                      controller: _minutesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Minutes',
                        labelStyle: TextStyle(color: Colors.grey),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade700),borderRadius: BorderRadius.circular(10)),
                        focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: TextField(
                      controller: _secondsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Seconds',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade700),borderRadius: BorderRadius.circular(10)),
                        focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50.h),
              ElevatedButton(
                onPressed: _startTimer,
                child: Text('Start Timer'
                  ,style: GoogleFonts.wallpoet(textStyle:
                 TextStyle(fontSize: 20.sp,color: Colors.black,),),),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isTimerRunning ? _stopTimer : _startTimer,
                child: Text('Stop Timer' ,
                  style: GoogleFonts.wallpoet(textStyle:
                 TextStyle(fontSize: 20.sp,color: Colors.black,),),),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: _resetTimer,
                child: Text('Reset Timer' ,
                  style: GoogleFonts.wallpoet(textStyle:
                 TextStyle(fontSize: 20.sp,color: Colors.black),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReverseTimer {
  late Timer _timer;
  late int durationInSeconds;
  late Function(int) onTick;
  late Function() onTimerFinished;

  ReverseTimer({
    required this.durationInSeconds,
    required this.onTick,
    required this.onTimerFinished,
  });

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (durationInSeconds > 0) {
        durationInSeconds--;
        onTick(durationInSeconds);
      } else {
        _timer.cancel();
        onTimerFinished();
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
  }
}
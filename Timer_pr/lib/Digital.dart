import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DigitalWatch extends StatefulWidget {
  const DigitalWatch({super.key});

  @override
  State<DigitalWatch> createState() => _DigitalWatchState();
}

class _DigitalWatchState extends State<DigitalWatch> {
  late DateTime dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    digitalClock();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg.jpg',)
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateFormat('hh : mm : ss').format(dateTime),
                style: GoogleFonts.wallpoet(textStyle:
                const TextStyle(fontSize: 50,color: Colors.white,),),
              ),
              const SizedBox(height: 20),
              Text(
                DateFormat('E, d MMM').format(dateTime),
                style: GoogleFonts.wallpoet(textStyle:
                const TextStyle(fontSize: 35,color: Colors.white,),),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Future<dynamic> digitalClock() async {
    dateTime = DateTime.now();
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        dateTime = DateTime.now();
      });
      digitalClock();
    });
  }
}


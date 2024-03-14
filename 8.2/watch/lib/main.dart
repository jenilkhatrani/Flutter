import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromRGBO(80, 68, 108, 1),
          title: Text('Watch',style: TextStyle(
              color: Colors.white),),
          shadowColor: Colors.black,
          elevation: 5,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(80, 68, 108, 1),
                Colors.blueAccent],
            ),
          ),
          child: Center(
            child: Container(
              height: 90,
              width: 260,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),

                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(10, 10),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Center(child: Text('Flutter',
                style: TextStyle(fontSize: 25,
                    color: Colors.white),)),
            ),
          ),),
      ),
    );
  }
}
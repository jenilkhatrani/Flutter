
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 100, 50),
        title: Text('A shadow button',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: 80,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.white,
                width: 1.0
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:  Color.fromRGBO(0, 120, 100, 50),
                blurRadius: 20,
                spreadRadius: 8,
              ),
            ],
          ),

          child: Center(
            child: Text(
              'TAP',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight:FontWeight.bold,
                  fontSize: 50
              ),
            ),
          ),
        ),
      ),

    );
  }
}

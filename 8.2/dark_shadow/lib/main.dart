
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
        backgroundColor: Colors.redAccent,
        title: Text('dark shadow button',
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
            color: Colors.black,
            border: Border.all(
                color: Colors.white,
                width: 1.0
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent,
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),

          child: Center(
            child: Text(
              'TAP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

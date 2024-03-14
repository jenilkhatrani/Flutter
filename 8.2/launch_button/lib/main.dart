
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
        backgroundColor: Colors.green,
        title: Text('Launch Button',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
                color: Colors.white,
                width: 2.0
            ),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),

          child: Center(
            child: Text(
              'Go',
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

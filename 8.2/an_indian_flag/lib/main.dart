import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 9,
        title: Text('An Indian Flag',
          style: TextStyle(color: Colors.white,
              fontSize: 30
          ,fontWeight: FontWeight.bold,

          ),),
      ),
      body: Center(
        child: Container(
            height: 160,
            width: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange, Colors.white, Colors.green],
                ),

                border: Border.all(color: Colors.white,width: 3)
            ),
            child: Center(
              child: Text(
                '✴',
                style: TextStyle(
                  fontSize: 50,

                ),
              ),
            )
        ),
      ),
    );
  }
}
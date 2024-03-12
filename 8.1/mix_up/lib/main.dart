import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(

    ),
  ),);
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
        backgroundColor: Colors.pinkAccent,
        title: Text('my app'),

      ),
      body: Center(
    child: Container(
      height: 400,
      width: 400,
      color: Colors.blueAccent,

      child: Container(
        padding: EdgeInsets.all(10.5),
        margin: EdgeInsets.fromLTRB(40,40,0,0),
        height: 250,
        width: 250,
        color: Colors.yellowAccent,

        child: Container(

              margin: EdgeInsets.fromLTRB(45, 45, 0, 0),
              height: 350,
              width: 350,
              color: Colors.pink,

          child: Container(
            margin: EdgeInsets.fromLTRB(0,0,30,30),
            height: 250,
            width: 250,
            color: Colors.orange,

           child: Container(
            margin: EdgeInsets.fromLTRB(0,0,30,30),
            height: 250,
             width: 250,
            color: Colors.green,

    child: Container(
    margin: EdgeInsets.fromLTRB(30,30,30,30),
    height: 250,
    width: 250,
    color: Colors.cyanAccent,
          ),
            )

        ),
      ),

    ),
    ), ), );
  }
}

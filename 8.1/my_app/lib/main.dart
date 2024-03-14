import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
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
backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('my app',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            height: 350,
          width: 350,
          color: Colors.greenAccent,

    child: Container(
    height: 200,
    width: 200,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
margin: EdgeInsets.all(30),
    color: Colors.green,

      child:Center(
        child:Text('oooo',
        style:TextStyle (
          color: Colors.black.withOpacity(0.5),
          fontSize: 180,
          letterSpacing: -45,

        ),),
      )
        ),
      ),
      ) );
  }
}

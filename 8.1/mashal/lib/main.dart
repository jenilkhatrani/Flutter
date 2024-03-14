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

      appBar: AppBar(
        centerTitle: true,
        title:Text ('mashal',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.brown,

      ),
      body: Center(
        child: Text('🕯️',
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}

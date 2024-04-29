
import 'package:flutter/material.dart';
import 'package:splash_screen/resume_screen.dart';
import 'package:splash_screen/splash_screen.dart';

import 'Refrences.dart';
import 'carrier.dart';
import 'contact_info.dart';
import 'education.dart';

void main()
{
  runApp(MaterialApp(
    initialRoute: 'splash',
    routes: {
      '1'     : (context) => const Homescreen(),
      'splash': (context) => const Splashscreen(),
      'resume': (context) =>  resume(),
      'contact':(context) => contact(),
      'carrier':(context) => carrier(),
      'education':(context)=> education(),
      'Refrences':(context)=>RefRences(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('my page',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'resume');
          }, icon:Icon(Icons.settings,color: Colors.black,size: 30,) )
      ],
      ),
    );
  }
}

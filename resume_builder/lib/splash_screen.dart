import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushNamedAndRemoveUntil(context, '1', (route) => false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome to app',
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
      ),
    );
  }
}

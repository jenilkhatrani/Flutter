import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, '2', (route) => false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF111517),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(50, 260, 50, 200),
        child: Column(
          children: [
            Center(
              child: Lottie.asset('assets/images/splash2.json',
                  height: 200,width: 200,fit: BoxFit.cover),),

            Text('flutter app',style: TextStyle(fontSize: 30,color: Colors.grey.shade400),)
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),
  );
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
      backgroundColor: Color.fromRGBO(80, 68, 108, 1),
      appBar: AppBar(
        title: Text('Gredient Button'
          ,style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Color.fromRGBO(80, 68, 108, 1),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 10,
      ),
      body: Center(
        child: Container(
          height: 90,
          width: 280,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.topLeft,
                // end: Alignment.topRight,
                colors: [Color.fromRGBO(146, 47, 181, 1),
                  Color.fromRGBO(82,101,216,1)],
                // stops: [0.1,1.0],
              ),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white,width: 3)
          ),
          child: Center(child: Text('Flutter',style: TextStyle(fontSize: 25,color: Colors.white),)),
        ),
      ),
    );
  }
}
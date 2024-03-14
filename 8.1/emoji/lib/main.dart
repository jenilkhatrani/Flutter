import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Container(
          child: Text('😊',
          style: TextStyle(
              fontSize: 200,

          ),),

        ),

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        height: 50,
        padding: EdgeInsets.all(2),


        child: Center(
          child: Text('Emoji',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold
            
          ),),
        ),
      ),


      );


  }
}



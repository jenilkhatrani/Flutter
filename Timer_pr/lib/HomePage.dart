import 'package:flutter/material.dart';
import 'package:timer_pr/Digital.dart';
import 'package:timer_pr/Timer.dart';
import 'package:timer_pr/analog.dart';
import 'package:timer_pr/stopwatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('O\' Clock',style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
        ),),
      ),
      body: IndexedStack(
        index: index,
        children: [
          ReverseTimerWidget(),
          DigitalWatch(),
          StopWatch(),
          analog(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (int newIndex) {

          setState(() {
            index = newIndex;
            print('$index');
            print(newIndex);

          });
        },
        items:const [
          BottomNavigationBarItem(
              label: 'Timer', icon:Icon(Icons.share_arrival_time_rounded)),
          BottomNavigationBarItem(
              label: 'DigitalClock', icon: Icon(Icons.watch_later_outlined,)),
          BottomNavigationBarItem(
              label: 'Stopwatch', icon: Icon(Icons.lock_clock)),
          BottomNavigationBarItem(
              label: 'analog', icon: Icon(Icons.lock_clock)),
        ],
      ),
    );
  }
}

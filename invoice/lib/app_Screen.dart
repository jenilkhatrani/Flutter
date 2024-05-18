

import 'package:flutter/material.dart';
import 'package:invoice/page/invoice.dart';
import 'page/history.dart';
import 'page/invoice.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            height:20,
            width: 20,
            child:const CircleAvatar(backgroundColor: Colors.white,child: Image(image: AssetImage('assets/images/icon.png',),
              height: 30,fit: BoxFit.contain,))),
        centerTitle: true,
        title:const Text('Invoice Generator',
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: IndexedStack(
        index : index,
        children: [
          InvoiceListPage(),
          Invoice(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Invoice Generator',
          ),

        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Colors.black,
        onTap: (newIndex){
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }
}
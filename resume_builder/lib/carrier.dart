import 'package:flutter/material.dart';
import 'package:splash_screen/utils/card.dart';

class carrier extends StatefulWidget {
  const carrier({super.key});

  @override
  State<carrier> createState() => _carrierState();
}

class _carrierState extends State<carrier> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _carrier = ''; // Variable to store the entered name
  String _software = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: const Icon(Icons.arrow_back_ios_new),),
        backgroundColor: Colors.cyan,
        title: const Text('Carrier Objective',style: TextStyle(fontSize: 25),),
      ),
      body: Column(
        children: [
          Container(
            key: _formKey,
            child: Form(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      card(title: 'Carrier Objective',
                          MaxLine: 7,
                          Label: 'Descripation'),
                      card(title: 'Current Designation (Experienced Candidate',
                          MaxLine: 1,
                          Label: 'Software engineer')
                    ],
                  ),
            )),
          )
        ],
      ),
    );
  }
}

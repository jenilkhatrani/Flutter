import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: designer(),
  ));
}
class designer extends StatefulWidget {
  const designer({super.key});

  @override
  State<designer> createState() => _designerState();
}

class _designerState extends State<designer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Row(
             children: [
               Expanded(child: Text('G',textAlign: TextAlign.right,
                 style: const TextStyle(
                   color: Colors.green,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
               Text('R',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('APHICS',style: const TextStyle(
                   color: Colors.green,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('FLUTTE',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.blue,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('E',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('R',style: const TextStyle(
                   color: Colors.blue,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('AN',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.green,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('D',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('ROID',style: const TextStyle(
                   color: Colors.green,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('DESIGN',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.yellow,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('&',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('DEVELOP',style: const TextStyle(
                   color: Colors.yellow,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.blue,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('W',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('Eb',style: const TextStyle(
                   color: Colors.blue,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('FAS',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.yellowAccent,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('H',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('ION',style: const TextStyle(
                   color: Colors.yellowAccent,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('ANIMAT',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.cyan,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('I',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('ON',style: const TextStyle(
                   color: Colors.cyan,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('I',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.blue,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('T',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('A-CS+',style: const TextStyle(
                   color: Colors.blue,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),

           Row(
             children: [
               Expanded(child: Text('GAM',textAlign: TextAlign.right,
                 style: const TextStyle(
                     color: Colors.yellow,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                 ),)),
               Text('E',style: const TextStyle(
                   color: Colors.red,
                   fontSize: 50
               ),),
               Expanded(child: Text('',style: const TextStyle(
                   color: Colors.yellow,
                   fontSize: 30,
                   fontWeight: FontWeight.bold
               ),)),
             ],
           ),
         ],
      ),
    );
  }
}

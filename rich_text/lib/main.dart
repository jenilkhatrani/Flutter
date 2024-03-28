import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: screen(),
    // home: second_4_2(),
    // home: third_4_3_2(),
    home: third_4_3_1(),
  ));
}

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return const Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text('hello'),
          Spacer(),
          Text('dart'),
          Spacer(),
          Text('flutter'),
          Spacer(),
        ],
      ),

    );
  }
}

// 4.2
// 4.2
// class second_4_2 extends StatefulWidget {
//   const second_4_2({super.key});
//
//   @override
//   State<second_4_2> createState() => _secondState();
// }
//
// class _secondState extends State<second_4_2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         centerTitle: true,
//         leading: Icon(
//           Icons.menu,
//           color: Colors.white,
//           size: 40,
//         ),
//         title: Text('Flutter App',
//           style: TextStyle
//             (
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             fontSize: 30
//           ),),
//       ),
//       body: Center(
//         child: Container(
//             child: Text('red & white group institutes \n One step in changing Education Chain...',
//                 textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.red,
//               fontSize: 24,
//               fontWeight: FontWeight.bold
//
//             )),
//         ),
//
//       ),
//     );
//   }
// }





// 4.3 2


// 4.3_____2

//4.3.2
// class third_4_3_2 extends StatefulWidget {
//   const third_4_3_2({super.key});
//
//   @override
//   State<third_4_3_2> createState() => _third_4_3_2State();
// }

// class _third_4_3_2State extends State<third_4_3_2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         title: Text('My RNW',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 30,
//           color: Colors.white
//         ),),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 child: RichText(
//                   text: TextSpan(
//
//                     text: '',
//                     style: TextStyle(fontSize: 50,
//                         fontWeight: FontWeight.bold,color: Colors.red,
//                        ),
//
//                     children: const <TextSpan>[
//                       TextSpan(text: '\n Red & White',
//                           style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 70,decoration: TextDecoration.underline
//                       )),
//
//                       TextSpan(text: '\n Multimedia Education',
//                           style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 40
//                           )),
//
//                       TextSpan(text: '\n  Shaping Skills for \"Scalling\" higher...!!!'
//                       ,style: TextStyle(
//
//                             fontSize: 20
//                           )),   ],
//                   ),
//
//             ),
//                   ),
//           ],
//         ),
//
//       ));
//   }
// }

// 4.3 1

// 4.3.1
class third_4_3_1 extends StatefulWidget {
  const third_4_3_1({super.key});

  @override
  State<third_4_3_1> createState() => _third_4_3_1State();
}

class _third_4_3_1State extends State<third_4_3_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 40,
        ),
        backgroundColor: Colors.yellow.shade700,
        centerTitle: true,
        title: const Text('Flutter App',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
      ),
      body: const next(),
      backgroundColor: Colors.black,
    );
  }
}
class next extends StatelessWidget {
  const next({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 50,
            decoration: TextDecoration.underline,
        color: Colors.red),
        child: Text('Hello world'),
      )
    );
  }
}

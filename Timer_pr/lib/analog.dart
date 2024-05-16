
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class analog extends StatefulWidget {
  const analog({super.key});

  @override
  State<analog> createState() => _analogState();
}

class _analogState extends State<analog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg.jpg',)
            )
        ),
        child: Center(
          child: AnalogClock(

            showDigitalClock: false,
            numberColor: Colors.white,
            tickColor: Colors.transparent,
            hourHandColor: Colors.white,
            minuteHandColor: Colors.grey.shade700,
            height: 300,
          ),
        ),
      ),
    );
  }
}



// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class Clock extends StatefulWidget {
//   @override
//   _ClockState createState() => _ClockState();
// }
//
// class _ClockState extends State<Clock> {
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage('assets/bg.jpg',)
//             )
//         ),
//         child: Center(
//           child: CustomPaint(
//             painter: ClockPainter(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ClockPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final centerX = size.width / 3;
//     final centerY = size.height / 2;
//     final center = Offset(centerX, centerY);
//     final radius = min(centerX, centerY);
//
//     final fillBrush = Paint()..color = Colors.transparent;
//     final outlineBrush = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;
//     final centerFillBrush = Paint()..color = Colors.white;
//     final secHandBrush = Paint()
//       ..color = Colors.red
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;
//     final minHandBrush = Paint()
//       ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.blue])
//           .createShader(Rect.fromCircle(center: center, radius: radius))
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;
//     final hourHandBrush = Paint()
//       ..shader = RadialGradient(colors: [Colors.lightGreen, Colors.green])
//           .createShader(Rect.fromCircle(center: center, radius: radius))
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8;
//
//     canvas.drawCircle(center, radius - 40, fillBrush);
//     canvas.drawCircle(center, radius - 40, outlineBrush);
//
//     final dateTime = DateTime.now();
//
//     final secHandX = centerX + 60 * cos(dateTime.second * 6 * pi / 180 - pi / 2);
//     final secHandY = centerY + 60 * sin(dateTime.second * 6 * pi / 180 - pi / 2);
//
//     final minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180 - pi / 2);
//     final minHandY = centerY + 80 * sin(dateTime.minute * 6 * pi / 180 - pi / 2);
//
//     final hourHandX = centerX +
//         60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - pi / 2);
//     final hourHandY = centerY +
//         60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 - pi / 2);
//
//     canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
//     canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
//     canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
//     canvas.drawCircle(center, 16, centerFillBrush);
//
//     final dashBrush = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//     final outerCircleRadius = radius;
//     final innerCircleRadius = radius - 14;
//
//     for (int i = 0; i < 360; i += 6) {
//       final x1 = centerX + outerCircleRadius * cos(i * pi / 180);
//       final y1 = centerY + outerCircleRadius * sin(i * pi / 180);
//
//       final x2 = centerX + innerCircleRadius * cos(i * pi / 180);
//       final y2 = centerY + innerCircleRadius * sin(i * pi / 180);
//
//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
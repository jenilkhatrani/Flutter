// import 'package:flutter/material.dart';
//
// class CheckBox extends StatefulWidget {
//   const CheckBox({super.key});
//
//   @override
//   State<CheckBox> createState() => _CheckBoxState();
// }
//
// class _CheckBoxState extends State<CheckBox> {
//   bool checkedValue = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//         Container(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: <Widget>[
//             CheckboxListTile(
//               title: Text("title text"),
//               value: checkedValue,
//               onChanged: (newValue) {
//                 setState(() {
//                   checkedValue = newValue!;
//                 });
//               },
//               controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
//             )
//           ],
//         ),
//       )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

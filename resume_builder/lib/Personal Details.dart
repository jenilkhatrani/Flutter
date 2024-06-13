import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen/utils/card.dart';
import 'package:splash_screen/utils/checkbox.dart';
import 'package:splash_screen/utils/colors.dart';

import 'utils/radiobutton.dart';

class personalDetails extends StatefulWidget {
   personalDetails({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>();
  String _name = ''; // Variable to store the entered name
  String _email = '';
  String _address = '';
  String _phone = '';
  void _submitForm() {
    // Check if the form is valid
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      // You can perform actions with the form data here and extract the details
      print('Name: $_name'); // Print the name
      print('Email: $_email');
      print('Email: $_address');
      print('Email: $_phone'); // Print the email
    }
  }
  @override
  State<personalDetails> createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon:const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.cyan,
        title:const Text('Personal details'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shadowColor: Colors.black,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const  card(title: 'DOB', MaxLine: 1, Label: 'DD/MM/YYYY'),
                  // CheckboxExample(),
                  const  Text('Marital Startus',style: TextStyle(color: Colors.cyan,fontSize: 25,fontWeight: FontWeight.bold),),
                  RadioExample(),
                  const  Text('Languages Known',style: TextStyle(color: Colors.cyan,fontSize: 25,fontWeight: FontWeight.bold),),

                const Row(
                  children: [
                    SizedBox(width: 18,),
                    CheckboxExample(),
                    Text('English'),
                  ],
                ),
                  const Row(
                  children: [
                    SizedBox(width: 18,),
                    CheckboxExample(),
                    Text('Hindi'),
                  ],
                ),
                  const Row(
                  children: [
                    SizedBox(width: 18,),
                    CheckboxExample(),
                    Text('Gujarati'),
                  ],
                ),
               const   card(title: 'Nationality', MaxLine: 1, Label: 'Indian'),

                const  SizedBox(height: 20,),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     height: 50,
                       width: 100,
                       color:Colors.cyan,
                       child: const Center(child: Text('save',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30),))),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class PersonalDetailsPage extends StatefulWidget {
//   @override
//   _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
// }
//
// class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
//   String _dateOfBirth = '';
//   String _maritalStatus = '';
//   List<String> _languagesKnown = [];
//   String _nationality = '';
//
//   TextEditingController _dateOfBirthController = TextEditingController();
//   TextEditingController _maritalStatusController = TextEditingController();
//   TextEditingController _nationalityController = TextEditingController();
//
//   void _saveDetails() {
//     // Implement save logic here
//     print('Date of Birth: $_dateOfBirth');
//     print('Marital Status: $_maritalStatus');
//     print('Languages Known: $_languagesKnown');
//     print('Nationality: $_nationality');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         title:const Text('Personal Details'),
//       ),
//       body: SingleChildScrollView(
//         padding:const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Card(
//               child: Padding(
//                 padding:const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   const  Text(
//                       'Date of Birth',
//                       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                     ),
//                     TextFormField(
//                       maxLines: 1,
//                       decoration:  InputDecoration
//                         (
//                         // labelText: 'carrier objective',
//                         label: Text('dd/mm/yyyy',
//                           style: TextStyle(
//                               fontSize:20,
//                               fontWeight:FontWeight.bold,
//                               color: Colors.grey[400],
//                               overflow: TextOverflow.ellipsis),),
//                         border:const OutlineInputBorder(),
//
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//             ),
//            const SizedBox(height: 20.0),
//             Card(
//               child: Padding(
//                 padding:const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   const  Text(
//                       'Marital Status',
//                       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           value: 'Single',
//                           groupValue: _maritalStatus,
//                           onChanged: (value) {
//                             setState(() {
//                               _maritalStatus = value.toString();
//                             });
//                           },
//                         ),
//                       const  Text('Single'),
//                         Radio(
//                           value: 'Married',
//                           groupValue: _maritalStatus,
//                           onChanged: (value) {
//                             setState(() {
//                               _maritalStatus = value.toString();
//                             });
//                           },
//                         ),
//                       const  Text('Married'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//            const SizedBox(height: 20.0),
//             Card(
//               child: Padding(
//                 padding:const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   const  Text(
//                       'Languages Known',
//                       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                     ),
//                     CheckboxListTile(
//                       title:const Text('English'),
//                       value: _languagesKnown.contains('English'),
//                       onChanged: (value) {
//                         setState(() {
//                           if (value!) {
//                             _languagesKnown.add('English');
//                           } else {
//                             _languagesKnown.remove('English');
//                           }
//                         });
//                       },
//                     ),
//                     CheckboxListTile(
//                       title:const Text('Spanish'),
//                       value: _languagesKnown.contains('Spanish'),
//                       onChanged: (value) {
//                         setState(() {
//                           if (value!) {
//                             _languagesKnown.add('Spanish');
//                           } else {
//                             _languagesKnown.remove('Spanish');
//                           }
//                         });
//                       },
//                     ),
//                     CheckboxListTile(
//                       title:const Text('French'),
//                       value: _languagesKnown.contains('French'),
//                       onChanged: (value) {
//                         setState(() {
//                           if (value!) {
//                             _languagesKnown.add('French');
//                           } else {
//                             _languagesKnown.remove('French');
//                           }
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//            const SizedBox(height: 20.0),
//             Card(
//               child: Padding(
//                 padding:const  EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                    const Text(
//                       'Nationality',
//                       style:const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                     ),
//                     TextFormField(
//                       maxLines: 1,
//                       decoration:  InputDecoration
//                         (
//                         // labelText: 'carrier objective',
//                         label: Text('Indian',
//                           style: TextStyle(
//                               fontSize:20,
//                               fontWeight:FontWeight.bold,
//                               color: Colors.grey[400],
//                               overflow: TextOverflow.ellipsis),),
//                         border:const OutlineInputBorder(),
//
//                       ),
//
//                     )
//                   ],
//                 ),
//               ),
//             ),
//            const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _saveDetails,
//               child:const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

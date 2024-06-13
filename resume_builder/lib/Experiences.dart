import 'package:flutter/material.dart';
import 'package:splash_screen/utils/card.dart';


class experience extends StatefulWidget {
  const experience({super.key});

  @override
  State<experience> createState() => _experienceState();
}

class _experienceState extends State<experience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.cyan,
        title: Text('Experience'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  card(title: 'Company name',
                      MaxLine: 1,
                      Label: 'azile infoways ,shivranjani'),
                card(title: 'School/college/Institute',
                    MaxLine: 1,
                    Label: 'Quality test engineer'),
               card(title: 'Roles/(Optional)',
                 MaxLine: 3,
                 Label: 'Working with team members to\n come up with new concepts\n and product analysis...',)
              , Text('employed status'),
                  // DatePickerDemo(),

                  Row(
                      children:[
                    // // RadioExample(),
                    //     ListTile(
                    //       title: const Text('Single',style: TextStyle(color: Colors.grey),),
                    //       leading: Radio<SingingCharacter>(
                    //         value: SingingCharacter.lafayette,
                    //         groupValue: _character,
                    //         onChanged: (SingingCharacter? value) {
                    //           setState(() {
                    //             _character = value;
                    //           });
                    // //         },
                    //       ),
                    //     ),
                  ]
                  ),
                  Row(
                    children: [
                      // RadioExample(),
                      // RadioExample(),
                    ],
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

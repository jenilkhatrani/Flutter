import 'package:flutter/material.dart';
import 'package:splash_screen/utils/card.dart';
import 'package:splash_screen/utils/colors.dart';

class education extends StatefulWidget {
  const education({super.key});

  @override
  State<education> createState() => _educationState();
}

class _educationState extends State<education> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.cyan,
        title: Text('Education'),
      ),
      body: ListView(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

            key: _formKey,
                child: Form(
                    child: Padding(
            padding:  EdgeInsets.fromLTRB(0, 00, 0, 0),
                child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

           card(
               title: 'Course/Degree',
               MaxLine: 1,
               Label: 'b.tech information technology'),

            card(
                title:'School/college/Institute',
                MaxLine: 1,
                Label: 'swarnim stsrtup and innovation university'
            ),
            card(title: 'School/college/Institute',
                MaxLine: 1,
                Label: '70% (or) 7.0 CGPA'
            ),
            card(title: 'years of pass',
                MaxLine: 1,
                Label: '2023')
          ],
        ),
            )
                )
            )
          ]
        ),
      ]
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_screen/utils/card.dart';
import 'package:splash_screen/utils/colors.dart';

class RefRences extends StatefulWidget {
  const RefRences({super.key});

  @override
  State<RefRences> createState() => _RefRencesState();
}

class _RefRencesState extends State<RefRences> {
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
          title: Text('References'),
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
                                    title: 'Refrence Name',
                                    MaxLine: 1,
                                    Label: 'kevin panchal'),

                                card(
                                    title:'Designation',
                                    MaxLine: 1,
                                    Label: 'Marketing manager ,id-158416'
                                ),
                                card(title: 'Organization/Institute',
                                    MaxLine: 1,
                                    Label: 'Green Energy Pvt,Ltd'
                                ),
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

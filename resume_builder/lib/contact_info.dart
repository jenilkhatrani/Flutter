import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class contact extends StatefulWidget {
  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  // Index to control which child to display
  int _currentIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); // A key for managing the form
  String _name = ''; // Variable to store the entered name
  String _email = ''; // Variable to store the entered email

  void _submitForm() {
    // Check if the form is valid
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      // You can perform actions with the form data here and extract the details
      print('Name: $_name'); // Print the name
      print('Email: $_email'); // Print the email
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[300],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios),
          ),
        backgroundColor: Colors.cyan,
        title: Text('Contact info'),
      ),
      body: Column(
        children: [
          // Buttons to switch between children
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                      height: 69,
                      color: Colors.cyan,
                      child: Center(child: Text(
                        'Contact', style: TextStyle(fontSize: 20),))
                  ),
                  onTap: () {
                    setState(() {
                      // Show the first child
                      _currentIndex = 0;
                    });
                  },
                ),
              ),
              // SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  child: Container(
                      height: 69,
                      color: Colors.cyan,
                      child: Center(child: Text(
                        'Photo  ', style: TextStyle(fontSize: 20),))),
                  onTap: () {
                    setState(() {
                      // Show the first child
                      _currentIndex = 1;
                    });
                  },
                ),
              ),

            ],
          ),
          SizedBox(height: 20),
          // IndexedStack to display children
          IndexedStack(
            // Index of the child to display
            index: _currentIndex,
            children: [
              // Child 1
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    child: Form(
                      key: _formKey, // Associate the form key with this Form widget
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Name',
                                  prefixIcon: Icon(Icons.person)),
                              // Label for the name field
                              validator: (value) {
                                // Validation function for the name field
                                if (value!.isEmpty) {
                                  return 'Please enter your name.'; // Return an error message if the name is empty
                                }
                                return null; // Return null if the name is valid
                              },
                              onSaved: (value) {
                                _name = value!; // Save the entered name
                              },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: 'Email',
                                  prefixIcon: Icon(Icons.mail)),
                              validator: (value) {
                                // Validation function for the email field
                                if (value!.isEmpty) {
                                  return 'Please enter your email.';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                _email = value!;
                              },
                            ),
                            TextFormField(

                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: 'Phone',
                                  prefixIcon: Icon(Icons.phone_android_rounded)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your mobile number.'; // Return an error message if the name is empty
                                }else if(value.length <10)

                                return 'enter full mobile number'; // Return null if the name is valid
                              },

                              onSaved: (value) {
                                _name = value!; // Save the entered name
                              },
                            ),
                            TextFormField(

                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(

                                  labelText: 'Address(street/building no',
                                  prefixIcon: Icon(Icons.location_city)),
                              // Label for the name field
                              validator: (value) {
                                // Validation function for the name field
                                if (value!.isEmpty) {
                                  return 'Please enter your address'; // Return an error message if the name is empty
                                }
                                return null; // Return null if the name is valid
                              },
                              onSaved: (value) {
                                _name = value!; // Save the entered name
                              },
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: _submitForm,
                              // Call the _submitForm function when the button is pressed
                              child: Text('Submit'), // Text on the button
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Child 2
              Center(
                child: Stack(
                    children: [
                      Container(
                          width: 200,
                          height: 200,
                          color: Colors.white,
                          child: Icon(
                            Icons.image, size: 90,
                          )

                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 120, 0, 0),
                        child: Icon(Icons.add, size: 35,color: Colors.red,),
                      )
                    ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

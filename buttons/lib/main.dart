import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Examples')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(' Button'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              child: Text('NULL'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text('Text'),
            ),
            SizedBox(height: 16),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              tooltip: 'Favorite',
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to Cart'),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: Text('Outline Button'),
            ),
            SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.mail),
              label: Text(' Mail button'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Disabled Button'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey, elevation: 0,
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Rounded Button'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Custom Size Button'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
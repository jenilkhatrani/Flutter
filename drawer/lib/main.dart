import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    // Placeholder profile image
                    backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'jenilkhatrani',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'jenilkhatrani002.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('about us'),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => aboutus()));},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Help'),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => help()));},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => setting()));},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => logout()));},
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('drawer page'),
      ),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home page'),
        ),
        body: Center(child: Text('it\'s our homepage)'
        )
        )
    );
  }
}
class aboutus extends StatefulWidget {
  const aboutus({super.key});

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about us'),
      ),
      body: Center(child: Text('about us')),
    );
  }
}

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('help'),
      ),
      body: Center(child: Text('how can we help you')),);
  }
}
class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: Center(child: Text('settings')),);
  }
}
class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lof out'),
      ),
      body: Center(child: Text('logging out succesfully')),);
  }
}

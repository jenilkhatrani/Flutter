import 'package:flutter/material.dart';

class Achievement extends StatefulWidget {
  const Achievement({super.key});

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  final _formkey = GlobalKey<FormState>();
  int index = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        toolbarHeight: 150,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 35,
              color: Colors.white,
            )),
        title: const Text(
          'Achievements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: index,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Exceeded sales 10% average'),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              remove();
                            });
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  },
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        add();
                      });
                    },
                    child: const Icon(Icons.add))
              ],
            ),
          )
        ],
      ),
    );
  }

  void add() {
    index = index + 1;
  }

  void remove() {
    index = index - 1;
  }
}
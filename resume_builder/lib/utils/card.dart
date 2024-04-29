import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key, required this.title, required this.MaxLine, required this.Label});
final String title;
final int MaxLine;
final String Label;

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(title,
                      style: TextStyle(fontSize: 25,color: Colors.cyan),),
                 ],
               ),
                TextFormField(
                  maxLines: MaxLine,
                  decoration:  InputDecoration
                    (
                    // labelText: 'carrier objective',
                      label: Text(Label,style: TextStyle(color: Colors.grey[400],
                          overflow: TextOverflow.ellipsis),),
                      border: OutlineInputBorder()
                  ),

                )
              ],
            ),
          ),
        )
    );
  }
}

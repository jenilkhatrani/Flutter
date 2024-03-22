import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_rounded,
        size: 40,
        color: Colors.black,),
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 30),

        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: select(),
            ),
            SizedBox(),
            SizedBox(
              height: 350,
              child: part1(),
            ),
            SizedBox(
              height: 400,
              child: part2(),
            ),
          ],
        ),
      ),
    );
  }
}

class select extends StatelessWidget {
  const select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              blurRadius: 1,
            )
          ]),
          child: const Row(
            children: [
              Text(
                'Select Category',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class part1 extends StatefulWidget {
  const part1({super.key});

  @override
  State<part1> createState() => _part1State();
}

class _part1State extends State<part1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 200, 0),
          child: const Text(
            'Smartphones',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          )),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 5),
                      color: Colors.grey,
                      blurRadius: 2,
                    )
                  ]),
              child: Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height: 140,
                        width: 200,
                        color: Colors.yellow,
                        child: Image.asset(
                          'asset/iphone 13.jpg',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'iPhone 13',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        '\$299',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 0.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      glow: false,
                      itemPadding: const EdgeInsets.all(4),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(5, 8),
                      color: Colors.grey,
                      blurRadius: 2,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //       // offset: Offset(2, 5),
                      //
                      //       )
                      // ]
                    ),
                    child: Image.asset(
                      'asset/iPhone-15.jpg',
                      fit: BoxFit.fill,
                      // height: 0,
                      width: 130,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        'iphone 15',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      '\$500',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 1,
                    minRating: 0.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    glow: false,
                    itemPadding: const EdgeInsets.all(4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    width: 0,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            )
          ])),
    ]));
  }
}
class part2 extends StatefulWidget {
  const part2({super.key});

  @override
  State<part2> createState() => _part2State();
}

class _part2State extends State<part2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(width: 10,),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 300, 30),
            child: Text(
              'laptop',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 8),
                            color: Colors.white,
                            blurRadius: 2,
                          )
                        ]),
                    height: 280,
                    width: 200,
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.green,
                            child: Image.asset(
                              'asset/hp.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'hp laptop pavillion',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              '&1000',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RatingBar.builder(
                            minRating: 1,
                            direction: Axis.horizontal,
                            initialRating: 3.5,
                            itemCount: 5,
                            itemSize: 30,
                            glow: false,
                            allowHalfRating: true,

                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ]
                    )
                ),
                SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, 8),
                          color: Colors.grey,
                          blurRadius: 2,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //       // offset: Offset(2, 5),
                          //       )
                          // ]
                        ),
                        child: Image.asset(
                          'asset/mackbook.webp',
                          fit: BoxFit.fill,
                          // height: 0,
                          width: 130,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            'mackbook pro',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '\$5000',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        glow: false,
                        itemPadding: const EdgeInsets.all(4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(
                        width: 0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

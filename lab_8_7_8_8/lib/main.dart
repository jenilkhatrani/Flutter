import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: detailpage(),
  ));
}
class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,size: 40,
        ),
        actions: const [Icon(Icons.shopping_cart,size: 40,)],
        centerTitle: true,
        title: const Text('DetailPage',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(

        children: [
          Container(
            child:
                Image.asset('asset/detail.jpg',
                height: 500,width: 500,),

          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 20,
                offset: Offset(2,5),
                color: Colors.grey)
              ],
              borderRadius: BorderRadius.only(

                  topLeft: Radius.circular(30,),topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            height: 367,
          width: double.infinity,
            child:  const Column(
              children: [Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text('Iphone X',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),),
          Padding(
            padding: EdgeInsets.fromLTRB(230,10,10,0),
            child: Text('&899',
              style: TextStyle(
                fontSize: 30,color: Colors.pinkAccent,fontWeight: FontWeight.w700),),
          ) ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Smartphones',style: TextStyle(
                          fontSize: 20,color: Colors.grey),),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0,10,10,0),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Colors.orangeAccent,),
                            Text('4.44',style: TextStyle(fontSize: 20,color: Colors.grey),)
                          ],
                        )
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,20,0,0),
                      child: Text('Brand',style: TextStyle(fontSize: 27,
                          fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,20,10,0),
                      child: Text('Apple',
                        style: TextStyle(fontSize: 20,
                            color: Colors.grey,fontWeight: FontWeight.w700),),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Stock',style: TextStyle(
                          fontSize: 27,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,20,10,0),
                      child: Text('34',style:
                      TextStyle(fontSize: 20,color:
                      Colors.grey,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 300, 0),
                     child: Text('Description',
                      style: TextStyle(fontWeight: FontWeight.w700,
                     fontSize: 25),),),
                  Padding(padding: EdgeInsets.all(15.0),
                 child: Text(style: TextStyle(fontSize: 20,color: Colors.grey),'Advanced dual-camera system with 12MP Wide and Ultra Wide cameras; Night mode, 4K Dolby Vision HDR recording'),
                   )
                  ],
                )
              ],
            ),

          ),

        ],
      ),
floatingActionButton:FloatingActionButton(
  onPressed: (){},
  child: const Icon(Icons.add_shopping_cart_outlined,
    color: Colors.white,size: 35,),
  backgroundColor: Colors.red,

),
    );

  }
}

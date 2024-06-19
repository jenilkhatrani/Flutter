import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Fruits(),
  ));
}

class Fruits extends StatelessWidget {

  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        shadowColor: Colors.grey,
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/Box.jpg',height: 50,width: 50,),
            const Text('List of Fruits',style: TextStyle(fontSize: 30,color: Colors.white),),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 700,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/apple.webp',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Apple',style: TextStyle(fontSize: 30,color: Colors.redAccent,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/Grapes.png',height: 70,),
                  const SizedBox(width: 30,),
                  const Text('Grapes',style: TextStyle(fontSize: 30,color: Colors.purpleAccent,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/ch.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Cherry',style: TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/st.png',height: 50,),
                  const SizedBox(width: 10,),
                  const Text('Strawberry',style: TextStyle(fontSize: 30,color: Colors.pinkAccent,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/mango.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Mango',style: TextStyle(fontSize: 30,color: Colors.orange,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/pine.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Pineapple',style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/lemon.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Lemon',style: TextStyle(fontSize: 30,color: Colors.orangeAccent,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/wt.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Watermelon',style: TextStyle(fontSize: 30,color: Colors.lightGreenAccent,fontWeight: FontWeight.w700),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/coco.png',height: 50,),
                  const SizedBox(width: 20,),
                  const Text('Coconut',style: TextStyle(fontSize: 30,color: Colors.brown,fontWeight: FontWeight.w700),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

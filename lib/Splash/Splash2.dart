import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../wrapper.dart';

//piano class for splash screen
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {            //function to initiate state
    super.initState();
    Timer((const Duration(seconds: 10)), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const wrapper()));      //call for home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Stack(         // to show pic on background of body
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/bgsplash.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(          //cicle box
                      radius: 80,
                      backgroundImage: AssetImage('assets/ss.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Quizer",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 65, fontFamily: 'Italianno',
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    SpinKitPouringHourGlassRefined(         //stylish spinkit
                      color: Colors.amber,
                      size: 50,
                    ),
                    SizedBox(height: 20,),
                    Text(                               //sinkit text
                      'Loading....',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                        color: Colors.black87,),
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    Text(                               //last text
                      'Knowledge is power. Test yours now',
                      style: TextStyle(fontSize: 30, color: Colors.red,fontFamily: 'Bahianita',),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

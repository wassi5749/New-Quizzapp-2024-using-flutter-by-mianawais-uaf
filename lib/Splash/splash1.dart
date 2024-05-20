import 'package:flutter/material.dart';
import 'dart:async';

import 'Splash2.dart';

class splash extends StatefulWidget {
  const splash({Key? key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentImageIndex = 0;        // track the current image index

  //List of image paths
  List<String> images = [
    'assets/ready.png',
    'assets/bulb.jpg',
    'assets/ready2.png',
    'assets/ready.png',

  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Duration of the animation
    );

    // Start the timer to switch images after 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) {
      // Check if we reached the last image, if yes navigate to Splash2
      if (currentImageIndex == images.length - 1) {
        timer.cancel(); // Cancel the timer
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Splash()),
        );
      } else {
        // Update the image index and trigger a rebuild with animation
        setState(() {
          currentImageIndex++;
          _controller.reset();
          _controller.forward();        //starts the animation from the beginning.
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Animated switch between images
            FadeTransition(
              opacity: _controller,
              child: Image.asset(
                images[currentImageIndex],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

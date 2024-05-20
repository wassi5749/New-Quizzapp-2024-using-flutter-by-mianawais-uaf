import 'package:flutter/material.dart';

//ResultBox class is made for Style for boxes of result screen

class ResultBox extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double boxHeight;
  final double boxWidth;

  ResultBox({super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 12,
    this.boxHeight = 60, // Set a fixed height
    this.boxWidth = 300, // Set a fixed width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHeight, // Apply fixed height
      width: boxWidth, // Apply fixed width
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.9),
            spreadRadius: 5,
            blurRadius: 9,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//class for login buttons/boxes

class CustomDecoration {
  static BoxDecoration backgroundImageDecoration(String imagePath) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }

  static InputDecoration inputDecoration(String hintText, IconData prefixIcon) {
    return InputDecoration(

      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      filled: true,
      fillColor: Colors.grey[300],
    );
  }
}


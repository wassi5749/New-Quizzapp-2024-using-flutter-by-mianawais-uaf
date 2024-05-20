import 'package:flutter/material.dart';
import 'package:quizer911/models/result_box.dart';
import 'coursescreen.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;

  ResultScreen({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
  });

  //Method for Show Feedback

  String getFeedbackMessage() {
    double percentage = (correctAnswers / totalQuestions) * 100;
    if (percentage >= 80) {
      return 'Excellent! your Scored:$percentage%';
    } else if (percentage >= 60) {
      return 'Your Score:$percentage%';
    } else if (percentage >= 40) {
      return 'Your Score:$percentage%';
    } else {
      return 'Your Score: $percentage%';
    }
  }


  void shareResults(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share functionality coming soon!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/new4.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResultBox(
                    text: 'Quiz Results',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 28,
                  ),
                  const SizedBox(height: 50),
                  ResultBox(
                    text: 'Total  Questions  : $totalQuestions',
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 28,
                  ),
                  const SizedBox(height: 20),
                  ResultBox(
                    text: 'Correct Answers : $correctAnswers',
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 28,
                  ),
                  const SizedBox(height: 20),
                  ResultBox(
                    text: 'Incorrect Answers: $incorrectAnswers',
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 28,
                  ),
                  const SizedBox(height: 20),
                  ResultBox(
                    text: getFeedbackMessage(),
                    backgroundColor: Colors.blueAccent,
                    textColor: Colors.white,
                    fontSize: 30,
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.grey,
                            title: const Text("Sorry.....!", style: TextStyle( fontWeight: FontWeight.bold,),),
                            content: const Text("This feature will be added soon!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Share Results',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    )

                  ),

                  const SizedBox(height: 10),

                  //Button For GO bAck to Home screen

                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content: const Text(
                                "Are you sure you want to go on home screen?"),
                            actions: [
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close
                                },
                              ),
                              TextButton(
                                child: const Text("Yes"),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CourseScreen(),
                                    ),
                                  );
                                },
                              ),

                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    )

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

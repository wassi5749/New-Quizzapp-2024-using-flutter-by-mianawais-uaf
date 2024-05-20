import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Readmore extends StatelessWidget {

  // List of URLs

  final List<Map<String, String>> links = [
    {'title': 'Islamic Study', 'url': 'https://pakmcqs.com/category/islamic-studies-mcqs'},
    {'title': 'Artificial Intelligence', 'url': 'https://www.javatpoint.com/artificial-intelligence-mcq'},
    {'title': 'Mobile App Development', 'url': 'https://www.javatpoint.com/android-mcq'},
    {'title': 'C-sharp ', 'url': 'https://www.includehelp.com/mcq/csharp-multiple-choice-questions-mcqs.aspx'},
    {'title': 'Data Structures', 'url': 'https://www.javatpoint.com/data-structure-mcq'},
    {'title': 'Algorithms', 'url': 'https://testbook.com/objective-questions/mcq-on-algorithms--5eea6a0c39140f30f369e0be'},
    {'title': 'Machine Learning', 'url': 'https://www.studocu.com/in/document/shivaji-university/computer-science/machine-learning-mcq-questions-and-answers/29821794'},
    {'title': 'English Grammar', 'url': 'https://cssmpt.com/english-mcqs/'},
    {'title': 'Database Management', 'url': 'https://www.sanfoundry.com/1000-database-management-system-questions-answers/'},
    {'title': 'Visual Basic', 'url': 'https://www.sanfoundry.com/1000-visual-basic-questions-answers/'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Center(
            child: Text(
              'Links For More Reading',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Elsie',
                color: Colors.white,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        //ListView.builder Show list of Urls

        body: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(links[index]['url']!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  minimumSize: const Size(150, 80), // Button size
                ),
                child: Text(
                  links[index]['title']!,
                  style: const TextStyle(fontSize: 20,color: Colors.blue,decoration: TextDecoration.underline,fontFamily: 'ProtestStrike'
                   ), // Button text size
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

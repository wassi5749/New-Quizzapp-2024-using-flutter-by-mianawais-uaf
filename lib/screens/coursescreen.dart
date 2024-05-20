import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer911/screens/Readmore.dart';
import 'ProfileScreen.dart';
import 'quizscreen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final user = FirebaseAuth.instance.currentUser;                       //for print Email of Login USer

  final List<String> courses = [                  //list of CourseS
    'Artificial Intelligence',
    'Machine Learning',
    'Mobile App Development',
    'C Programming',
    'Data Structures',
    'Algorithms',
    'Web Development',
    'C++',
    'Database Management',
    'Islamic Study',
    'Visual Basic',
    'English Grammar',
  ];

  int _selectedIndex = 0;

  get useremail => null;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {                     //navigation barr indexes
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(userEmail: user!.email!, signOutCallback: signout),
        ),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Readmore(),
        ),
      );
    }

  }
  void navigateToQuizScreen(BuildContext context, String courseName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(courseName: courseName),
      ),
    );
  }


  void signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Choose A Course for Quiz',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Elsie',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        backgroundColor: Colors.indigo,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/quiz1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const ListTile(
              title: Text(
                'About Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Nosifer',
                    backgroundColor: Colors.amber),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From    :   \n  UAF  SubCampus  Burewalla \n\n'
                        'Location:   \n              Burewalla Punjab \n\n'
                        'Number  :   \n              +9200000000 \n\n'
                        'Email   :   \n              mian0123@gmail.com \n\n'
                        'Company :   \n              MianCoders \n\n'
                        'Special Thanks :   \n              Mr Shoaib Farooq \n\n',
                    style: TextStyle(fontSize: 17,fontFamily:'Elsie' ,color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //Display Gridview with courses

      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                navigateToQuizScreen(context, courses[index]);
              },
              child: Card(
                elevation: 10,
                color: Colors.white54,
                child: Center(
                  child: Text(
                    courses[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'ProtestStrike',
                    ),
                  ),
                ),
              ),
            );
          },
        ),

      ),

      //Navigation Barr

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.indigo,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.indigo,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode_outlined,color: Colors.indigo,),
            label: 'Reading',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login.dart';

class ProfileScreen extends StatelessWidget {
  final String userEmail;
  final Function signOutCallback;

  const ProfileScreen({super.key, required this.userEmail, required this.signOutCallback});

  @override
  Widget build(BuildContext context) {
    void signout() async {
      await FirebaseAuth.instance.signOut();
    }
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Center(
          child: Text('My Profile' ,style: TextStyle(
              fontSize: 30,fontFamily: 'Elsie',color: Colors.white
          ),),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                accountEmail: Text(userEmail,style: const TextStyle(fontFamily: 'ProtestRiot',fontSize: 20),),
                accountName: const Text(''),
                currentAccountPicture: CircleAvatar(
                  child: Text(userEmail[0].toUpperCase()),
                ),
              ),
              const ListTile(
                title: Text('Click On Logout Button To Logout',
                  style: TextStyle(fontFamily: 'ProtestRiot',color: Colors.white),),
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nosifer',
                    backgroundColor: Colors.amber,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure you want to logout?",),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();                          // Close the dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              signout();
                              Get.offAll(() => const login());
                            },
                            child: const Text("Logout"),),],);
                    },
                  );
                },
              ),
              const ListTile(
                title: Text('___________________________'),
              ),
              const ListTile(
                title: Text(
                  'App Functionalities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Nosifer',
                    backgroundColor: Colors.amber,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Users can Login with their verified email, password.\n'
                          '• Users can Register with their email, password, age, location, and AG number.\n'
                          '• Email verification is implemented for user accounts to ensure security.\n'
                          '• Users can reset their password through a "Forgot Password" feature.\n'
                          '• The home screen displays a list of courses\n'
                          '• Users can tap on a course to take a quiz.\n'
                          '• After completing the quiz, users can view their results.\n'
                          '• Users can view their correct and incorrect answers after completing the quiz.\n'
                          '• Bottom navigation bar provides quick access',
                      style: TextStyle(fontSize: 13,fontFamily: 'ProtestRiot',color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

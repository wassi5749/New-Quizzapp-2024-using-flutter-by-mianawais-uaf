import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizer911/login.dart';
import 'screens/coursescreen.dart';
import 'verify.dart';

class wrapper extends StatefulWidget {
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),       //It listens to changes in the authentication state
          builder: (context,snapshot){                            // gets called whenever new data arrives on the stream
            if( snapshot.hasData){
              if (snapshot.data!.emailVerified){
                return const CourseScreen();
              }else {
                return const Verify();
              }
            }else{
              return const login();

            }
          }),
    );
  }
}

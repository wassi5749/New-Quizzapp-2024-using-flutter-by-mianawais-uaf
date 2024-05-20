import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizer911/forget.dart';
import 'package:quizer911/signup.dart';
import 'package:quizer911/wrapper.dart';
import 'models/result_box.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading=false;

  signin() async {
    setState(() {
      isloading = true;
    });

    try {
      // Perform sign-in operation
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.offAll(() => const wrapper());
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      Get.snackbar("Error Message", e.code);
    } catch (e) {
      // Handle other exceptions
      Get.snackbar("Error Message", e.toString());
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
      return isloading
          ? const Center(child: CircularProgressIndicator(),)
          : Scaffold(
        body: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/abs.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 100, 10),  // Adjust top padding to control distance from tlrb
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back',
                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Please Enter your details to login',
                        style: TextStyle(color: Colors.black,fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: email,
                        decoration: CustomDecoration.inputDecoration('Enter Email', Icons.email),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: password,
                        decoration: CustomDecoration.inputDecoration('Enter Password', Icons.lock),
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed:  () {
                          Get.offAll(signin());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.login),
                            SizedBox(width: 10),
                            Text('Login',
                              style: TextStyle(
                                color: Colors.white,fontSize: 15, // Text color
                              ),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed:  () {
                          // Navigate to the signup/coursescreen screen
                          Get.to(() => const signup());
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_add),
                            SizedBox(width: 10),
                            Text('Register Now',
                              style: TextStyle(
                              color: Colors.white, fontSize: 15,// Text color
                            ),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the forgot password screen
                          Get.to(() => const forgot());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock_open),
                            SizedBox(width: 10),
                            Text('Forgot Password',
                              style: TextStyle(
                              color: Colors.white, fontSize: 20,
                            ),

                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );


  }
}
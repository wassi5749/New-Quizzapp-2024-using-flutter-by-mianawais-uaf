import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'models/result_box.dart';
import 'login.dart';
class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgetState();
}

class _forgetState extends State<forgot> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  reset() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/abs.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Resest Password',
                  style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 30),
                const Text(
                  'We will send you an email. Please use it to change your password THANKS',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: email,
                  decoration: CustomDecoration.inputDecoration('Enter Email', Icons.attach_email),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    reset();            // Call the reset function
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white70,
                        content: Text('Link sent to your email Please check your Email',
                          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.link_off),
                      SizedBox(width: 10),
                      Text('Send link to gmail',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_sharp),
                      SizedBox(width: 10),
                      Text('Back to login',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

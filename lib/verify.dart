import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'wrapper.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    sendVerifyLink();                //method for sending a verify link
    super.initState();
  }

  sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
      Get.snackbar('Link Sent', 'A link has been sent to your email',
          margin: const EdgeInsets.all(30))
    });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then((value) => Get.offAll(const wrapper()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child: Text('Verification',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      )),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Open your email and click on the link\nand reload from the bottom button',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        //reload page after Link vrification

        onPressed: (() => reload()),
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}

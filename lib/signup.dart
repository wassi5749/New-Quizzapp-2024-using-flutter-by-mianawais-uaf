import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quizer911/login.dart';
import 'package:quizer911/wrapper.dart';
import 'models/result_box.dart';
import 'package:intl/intl.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age= TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController Number = TextEditingController();

  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(() => const wrapper());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/abs.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 100, 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    const Text('Welcome to Family',style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 25),),
                    const SizedBox(height: 15,),
                    const Text('Please Enter your details to signup',style: TextStyle(color: Colors.black,fontSize: 15),),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: email,
                      decoration: CustomDecoration.inputDecoration('Enter Email', Icons.email),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: Number,
                      decoration: CustomDecoration.inputDecoration('Enter Phone', Icons.phone_android),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: password,
                      decoration: CustomDecoration.inputDecoration('Enter Password', Icons.lock),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          age.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                        }
                      },
                      //AbsorbPointer to shoe date picker

                      child: AbsorbPointer(
                        child: TextField(
                          controller: age,
                          decoration: CustomDecoration.inputDecoration('Enter Age', Icons.calendar_today),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),
                    TextField(
                      controller: Location,
                      decoration: CustomDecoration.inputDecoration('Enter Location', Icons.location_city),

                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: (() => signup()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.login),
                          SizedBox(width: 10),
                          Text('Signup',style: TextStyle(
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => const login());
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
            ),
          ),
        ],
      ),
    );


  }
}

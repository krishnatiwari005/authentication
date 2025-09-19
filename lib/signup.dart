import 'package:authtask/wrapper.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   
     var Get;


   Signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(const Wrapper());
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body:Padding(
        padding:const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'ENTER EMAIL' ),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'ENTER PASSWORD' ),
            ),
            ElevatedButton(onPressed:(()=Signup()), child: const Text("SIGN UP"))
          ],
        ),
      )
    );
  }
}
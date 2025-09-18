import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();


   signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'ENTER EMAIL' ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'ENTER PASSWORD' ),
            ),
            ElevatedButton(onPressed:(()=signIn()), child: Text("LOGIN"))
          ],
        ),
      )
    );
  }
}
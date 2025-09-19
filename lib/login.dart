import 'package:authtask/forgot.dart';
import 'package:authtask/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   bool isloading=false;
   
     var Get;

   signIn()async{
    setState(() {
      isloading=true;
    });

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);

    }on FirebaseAuthException catch(e){
    Get.snackBar("error msg",e.code);
    }catch(e){
      Get.snackBar("error msg",e.toString());
      setState(() {
      isloading=false;
    });
      
    }
   }

  @override
  Widget build(BuildContext context) {
    return isloading?const Center(child: CircularProgressIndicator(),): Scaffold(
      appBar:AppBar(title:const Text("Login")),
      body:Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration:InputDecoration(hintText: 'ENTER EMAIL' ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'ENTER PASSWORD' ),
            ),
            ElevatedButton(onPressed:(()=>signIn()), child: Text("LOGIN")),
            SizedBox(height: 30,),
             ElevatedButton(onPressed:(()=>Get.to(Signup())), child: Text("REGISTER NOW")),
             SizedBox(height: 30,),
              ElevatedButton(onPressed:(()=>Get.to(Forgot())), child: Text("FORGOT PASSWORD ?"))
          ],

        ),
      )
    );
  }
}
import 'package:authtask/homepage.dart';
import 'package:authtask/login.dart';
import 'package:authtask/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If the connection is still waiting, show a loading spinner
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If there's no user, show the login screen
          if (!snapshot.hasData) {
            return const Login();
          }

          // If the user's email is verified, show the homepage
          if (snapshot.data!.emailVerified) {
            return const Homepage();
          }

          // If user is logged in but not verified, show the verify screen
          return const Verify();
        },
      ),
    );
  }
}

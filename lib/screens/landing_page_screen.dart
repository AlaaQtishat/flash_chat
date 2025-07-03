import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'chat_screen.dart';

import 'welcome_screen.dart';

class LandingScreen extends StatelessWidget {
  static const String id = 'landing_screen';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: Future.value(FirebaseAuth.instance.currentUser),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // عرض شاشة تحميل

          return Scaffold(
            backgroundColor: Colors.pink,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('images/logo.png', height: 60),

                  SizedBox(height: 20),

                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, ChatScreen.id),
            );
          } else {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, WelcomeScreen.id),
            );
          }

          return Scaffold(body: SizedBox());
        }
      },
    );
  }
}

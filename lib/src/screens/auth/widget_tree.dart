import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/auth/main_screen.dart';
import 'package:chat_app/src/screens/user_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while checking the authentication state
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return MainScreen();
        }
      },
    );
  }
}

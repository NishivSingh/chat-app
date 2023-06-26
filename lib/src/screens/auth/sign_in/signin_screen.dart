import 'package:chat_app/src/screens/auth/sign_in/signin_screen_widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
              ),
              loginForm(),
              loginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
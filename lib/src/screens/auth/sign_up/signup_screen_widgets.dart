import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/auth/sign_in/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SignUpForm({super.key});

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    final completer = Completer<void>();
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);
      completer.complete();
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }

    completer.future.then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneNoController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createUserWithEmailAndPassword(context);
                  }
                },
                child: Text('Sign Up'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

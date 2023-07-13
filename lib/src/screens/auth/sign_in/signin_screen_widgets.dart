import 'dart:async';
import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/screens/profile/home_screen.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginForm({super.key});

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    final completer = Completer<void>();
    final email = _controllerEmail.text;
    final password = _controllerPassword.text;

    try {
      await Auth().signInWithEmailAndPassword(email: email, password: password);
      if (Auth().currentUser != null) {
        completer.complete();
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }

    completer.future.then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: _controllerEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _controllerPassword,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signInWithEmailAndPassword(context);
                  }
                },
                child: Text('Login'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

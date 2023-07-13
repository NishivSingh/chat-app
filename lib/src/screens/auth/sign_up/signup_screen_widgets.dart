import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/auth/sign_in/signin_screen.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      print("Hi");
      print(e);
    }
  }

  SignUpForm({Key? key}) : super(key: key);

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
                    label: Text(fullName),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    label: Text(email),
                    prefixIcon: Icon(Icons.email_outlined),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _phoneNoController,
                  decoration: const InputDecoration(
                    label: Text(phoneNo),
                    prefixIcon: Icon(Icons.numbers),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text(password),
                  prefixIcon: Icon(Icons.fingerprint),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await createUserWithEmailAndPassword();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }
                  },
                  child: Text(signUp.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}

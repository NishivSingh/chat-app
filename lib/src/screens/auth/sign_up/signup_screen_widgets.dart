import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    label: Text(fullName),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text(email),
                    prefixIcon: Icon(Icons.email_outlined),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: phoneNoController,
                  decoration: const InputDecoration(
                    label: Text(phoneNo),
                    prefixIcon: Icon(Icons.numbers),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text(password),
                    prefixIcon: Icon(Icons.fingerprint),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState.validate()){
                    //   registerUser(emailController.text, passwordController.text);
                    // }
                  },
                  child: Text(signUp.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}

void registerUser(String email, String password) {}

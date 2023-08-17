import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/user_screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePhoneNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone no. is required';
    }
    if (value.length < 10) {
      return 'Invalid phone no.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be greater than 6 characters';
    }
    return null;
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    final completer = Completer<void>();
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);

      // Send email verification
      final user = Auth().currentUser;
      if (user != null && !user.emailVerified) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please check your inbox for email verification.'),
          ),
        );
        await user.sendEmailVerification();
      }

      completer.complete();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    } catch (e) {
      // Handle other unexpected exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('An unexpected error occurred. Please try again later.'),
        ),
      );
    }

    completer.future.then((_) {
      // Continue showing the loading screen until the email is verified.
      _showLoadingDialog(context);

      // Wait for email verification process to complete.
      _waitForEmailVerification(context);
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _waitForEmailVerification(BuildContext context) async {
    final user = Auth().currentUser;
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        await _storeUserDataInFirestore(user);
        // ignore: use_build_context_synchronously
        Navigator.pop(context); // Close the loading dialog
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Wait and check again after a short delay (e.g., 2 seconds).
        await Future.delayed(const Duration(seconds: 2));
        // ignore: use_build_context_synchronously
        _waitForEmailVerification(context);
      }
    }
  }

  Future<void> _storeUserDataInFirestore(User user) async {
    String currentUid = user.uid;
    try {
      await _firestore.collection("users").doc(currentUid).set({
        "name": _fullNameController.text,
        "email": _emailController.text,
        "phoneNo": _phoneNoController.text,
        "connections": [],
        "uid": currentUid,
      });
    } catch (e) {
      // Handle any errors that occurred during Firestore data storage
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while storing user data.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              validator: _validateName,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneNoController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              validator: _validatePhoneNo,
              keyboardType: TextInputType.phone,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              validator: _validatePassword,
              autofillHints: const [AutofillHints.newPassword],
            ),
            const SizedBox(height: 20),
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

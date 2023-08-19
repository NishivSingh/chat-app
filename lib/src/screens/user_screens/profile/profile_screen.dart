import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/auth/widget_tree.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

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

  Future<void> _updateUserProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(Auth().currentUser!.uid)
          .update({
        "name": _fullNameController.text,
        "email": _emailController.text,
        "phoneNo": _phoneNoController.text,
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    }
  }

  Future<void> _signOut(BuildContext context) async {
    final completer = Completer<void>();

    try {
      await Auth().signOut();
      completer.complete();
    } catch (e) {
      // ignore: avoid_print
      print('Error signing out: $e');
      completer.completeError(e);
    }

    completer.future.then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    }).catchError((error) {
      // ignore: avoid_print
      print('Error completing sign out: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("users")
          .doc(Auth().currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(child: Text("error"));
        }

        Map<String, dynamic> data = snapshot.data!.data()!;

        if (!_isEditing) {
          _fullNameController.text = data["name"];
          _emailController.text = data["email"];
          _phoneNoController.text = data["phoneNo"];
        }

        return Column(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: const CircleBorder(),
                  color: isDarkTheme ? darkAccentColor : lightAccentColor,
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.05),
                    child: Text(
                      data["name"][0],
                      style: TextStyle(
                          fontSize: 50,
                          color: isDarkTheme ? blackColor : whiteColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                // SizedBox(height: screenHeight * 0.001),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon:
                                const Icon(Icons.person_outline_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: isDarkTheme
                                        ? darkAccentColor
                                        : lightAccentColor)),
                          ),
                          enabled: _isEditing,
                          validator: _validateName,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _phoneNoController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: isDarkTheme
                                        ? darkAccentColor
                                        : lightAccentColor)),
                          ),
                          validator: _validatePhoneNo,
                          keyboardType: TextInputType.phone,
                          autofillHints: const [AutofillHints.telephoneNumber],
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: isDarkTheme
                                        ? darkAccentColor
                                        : lightAccentColor)),
                          ),
                          validator: _validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          enabled: false,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isDarkTheme
                                    ? darkAccentColor
                                    : lightAccentColor,
                                shape: const StadiumBorder()),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_isEditing) {
                                  await _updateUserProfile();
                                }
                                setState(() {
                                  _isEditing = !_isEditing;
                                });
                              }
                            },
                            child: Text(
                                _isEditing ? "Save Profile" : "Edit Profile"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  _signOut(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }
}

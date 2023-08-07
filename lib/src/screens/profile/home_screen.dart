import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat/chat_page.dart';
import 'package:chat_app/src/screens/profile/chat/chat_screen.dart';
import 'package:chat_app/src/screens/profile/connect/connect_screen.dart';
import 'package:chat_app/src/screens/profile/profile/profile_screen.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/screens/auth/widget_tree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current index of the selected tab

  final List<Widget> _pages = [
    const ChatScreen(), // Chats page (replace with your HomeScreen)
    const ConnectScreen(), // Replace with your ContactsScreen
    const ProfileScreen(), // Replace with your SettingsScreen
  ];

  final List<String> _titles = ["Chats", "Connect with others", "Profile"];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: _pages[_currentIndex], // Show the current page
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the current tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ...
}

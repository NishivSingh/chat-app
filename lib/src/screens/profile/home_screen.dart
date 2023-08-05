import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/screens/auth/widget_tree.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatPage()));
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Move to main screen"),
          ),
        ),
      ),
    );
  }
}

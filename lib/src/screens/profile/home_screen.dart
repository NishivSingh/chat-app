import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/screens/auth/widget_tree.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  Future<void> _signOut(BuildContext context) async {
    try {
      await Auth().signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
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
        child: const Text("Hello World!"),
      ),
    );
  }
}

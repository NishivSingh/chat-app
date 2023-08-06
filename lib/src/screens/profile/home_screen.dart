import 'dart:async';

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat/chat_page.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser!.uid) // Get the current user's document
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading ....");
        }

        if (snapshot.hasError) {
          return const Text("error");
        }

        List<String> connectedUserIds = [];
        if (snapshot.hasData) {
          // Get the list of connected user IDs from the "connections" field
          Map<String, dynamic> data =
              snapshot.data!.data()! as Map<String, dynamic>;
          if (data.containsKey("connections") && data["connections"] is List) {
            connectedUserIds = List<String>.from(data["connections"]);
          }
        }
        if (connectedUserIds.isEmpty) {
          return const Text("No connected users found.");
        }

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where(FieldPath.documentId,
                  whereIn: connectedUserIds) // Query only connected users
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("loading ....");
            }

            if (snapshot.hasError) {
              return const Text("error");
            }

            if (!snapshot.hasData) {
              return const Text("No connected users found.");
            }

            List<DocumentSnapshot> connectedUsers = snapshot.data!.docs;
            if (connectedUsers.isEmpty) {
              return const Text("No connected users found.");
            }

            return ListView(
              children: connectedUsers
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList(),
            );
          },
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return ListTile(
      title: Text(data["name"]),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ChatPage(
                      recieverUserName: data["name"],
                      recieverUserEmail: data["email"],
                      recieverUserId: data["uid"],
                    ))));
      },
    );
  }
}

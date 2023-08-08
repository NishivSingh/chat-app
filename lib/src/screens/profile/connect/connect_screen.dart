import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  Future<void> _sendConnectionRequest(String recipientUid) async {
    final currentUserUid = Auth().currentUser!.uid; // Get current user's UID
    final userRef = FirebaseFirestore.instance.collection('users');

    try {
      await userRef.doc(currentUserUid).update({
        'connections': FieldValue.arrayUnion([recipientUid]),
      });
    } catch (e) {
      // Handle the error, show an error message, etc.
    }
  }

  Future<List<Map<String, dynamic>>> fetchUsersFromFirebase() async {
    List<Map<String, dynamic>> users = [];

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> user = doc.data() as Map<String, dynamic>;

        if (user["uid"] != Auth().currentUser!.uid) {
          users.add(user);
        }
      }

      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUsersFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text('Error fetching users'); // Show error message
        } else {
          final users = snapshot.data;

          return ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Text(user['email']),
              );
            },
          );
        }
      },
    );
  }
}

import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat/chat_page.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  Future<void> _sendConnectionRequest(
      String recipientName, String recipientEmail, String recipientUid) async {
    final currentUserUid = Auth().currentUser!.uid; // Get current user's UID
    final userRef = FirebaseFirestore.instance.collection('users');

    try {
      await userRef.doc(currentUserUid).update({
        'connections': FieldValue.arrayUnion([recipientUid]),
      });
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatPage(
                  recieverUserName: recipientName,
                  recieverUserEmail: recipientEmail,
                  recieverUserId: recipientUid)));
    } catch (e) {
      // Handle the error, show an error message, etc.
    }
  }

  Future<List<Map<String, dynamic>>> fetchUsersFromFirebase() async {
    List<Map<String, dynamic>> users = [];

    try {
      String currentUserUid = Auth().currentUser!.uid;
      DocumentSnapshot currentUserDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .get();
      Map<String, dynamic> usersData =
          currentUserDoc.data() as Map<String, dynamic>;
      List<dynamic> connections = usersData['connections'] ?? [];

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> user = doc.data() as Map<String, dynamic>;
        String userUid = user['uid'];

        if (userUid != currentUserUid && !connections.contains(userUid)) {
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
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUsersFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Show loading indicator
        } else if (snapshot.hasError) {
          return const Text('Error fetching users'); // Show error message
        } else {
          final users = snapshot.data;

          return users!.isNotEmpty
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      elevation: 8,
                      child: ListTile(
                        title: Text(user['name']),
                        subtitle: Text(user['phoneNo']),
                        trailing: ElevatedButton(
                            onPressed: () => _sendConnectionRequest(
                                user["name"], user["email"], user["uid"]),
                            style: ElevatedButton.styleFrom(
                                elevation: 8,
                                foregroundColor:
                                    isDarkTheme ? darkColor : whiteColor,
                                backgroundColor:
                                    isDarkTheme ? primaryColor : accentColor,
                                side: BorderSide(
                                    color: isDarkTheme
                                        ? primaryColor
                                        : accentColor),
                                padding: const EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Text('Connect')),
                      ),
                    );
                  },
                )
              : const Center(child: Text("No users found to connect"));
        }
      },
    );
  }
}

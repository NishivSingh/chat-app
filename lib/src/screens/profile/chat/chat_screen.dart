import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat/chat_page.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: _buildUserList(isDarkTheme),
      ),
    );
  }

  Widget _buildUserList(isDarkTheme) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection("users")
          .doc(Auth().currentUser!.uid) // Get the current user's document
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                  .map<Widget>((doc) => _buildUserListItem(doc, isDarkTheme))
                  .toList(),
            );
          },
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document, isDarkTheme) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return ListTile(
      title: Row(
        children: [
          Card(
            shape: const CircleBorder(),
            color: isDarkTheme ? primaryColor : accentColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                data["name"][0],
                style: TextStyle(
                    fontSize: 16,
                    color: isDarkTheme ? secondaryColor : whiteColor),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(data["name"]),
          ),
        ],
      ),
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

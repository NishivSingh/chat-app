import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/screens/profile/chat/chat_bubble.dart';
import 'package:chat_app/src/screens/profile/chat/chat_service.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserName;
  final String recieverUserEmail;
  final String recieverUserId;
  const ChatPage(
      {super.key,
      required this.recieverUserName,
      required this.recieverUserEmail,
      required this.recieverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieverUserId, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.recieverUserName,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )),
      body: Column(children: [
        Expanded(
          child: _buildMessageList(isDarkTheme),
        ),
        _buildMessageInput(isDarkTheme),
      ]),
    );
  }

  Widget _buildMessageList(isDarkTheme) {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.recieverUserId, Auth().currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GroupedListView<Map<String, dynamic>, DateTime>(
          padding: const EdgeInsets.all(2),
          reverse: true,
          order: GroupedListOrder.DESC,
          // useStickyGroupSeparators: true,
          // floatingHeader: true,
          elements: snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList(),
          groupBy: (document) {
            // Group messages by their date (ignoring time)
            DateTime timestamp = document['timestamp'].toDate();
            return DateTime(timestamp.year, timestamp.month, timestamp.day);
          },
          groupSeparatorBuilder: (DateTime date) {
            // Build a widget for the date separator
            return ListTile(
              title: Center(
                child: Card(
                  color: isDarkTheme ? primaryColor : accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat.yMd().format(
                          date), // Display date in 'Month Day, Year' format
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDarkTheme ? secondaryColor : whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, Map<String, dynamic> document) {
            // Build a widget for each chat message
            return _buildMessageItem(document);
          },
        );
      },
    );
  }

  Widget _buildMessageInput(isDarkTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextField(
                  controller: _messageController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: "Type your message here...",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  )),
            ),
          )),
          Card(
            elevation: 8,
            shape: const CircleBorder(),
            color: isDarkTheme ? primaryColor : accentColor,
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.arrow_forward),
              color: isDarkTheme ? secondaryColor : whiteColor,
              iconSize: 40,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> data) {
    // Convert Firestore timestamp to DateTime
    Timestamp timestamp =
        data["timestamp"]; // Replace with the actual field name
    DateTime dateTime = timestamp.toDate();

    // Format the DateTime to show only the time
    String formattedTime = DateFormat.jm().format(dateTime);

    final isCurrentUser = (data["senderId"] == Auth().currentUser!.uid);
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    var crossAxisAlignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    var mainAxisAlignment =
        isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        alignment: alignment,
        child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              ChatBubble(
                message: data["message"],
                senderId: data["senderId"],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Text(formattedTime),
              )
            ]),
      ),
    );
  }
}

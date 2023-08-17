import 'package:chat_app/src/screens/auth/auth.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String senderId;
  const ChatBubble({super.key, required this.message, required this.senderId});

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = (senderId == Auth().currentUser!.uid);
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;
    final bubbleColor =
        isCurrentUser ? (isDarkTheme ? primaryColor : accentColor) : whiteColor;
    final textColor = isCurrentUser
        ? (isDarkTheme ? darkColor : whiteColor)
        : (isDarkTheme ? darkColor : accentColor);

    return Card(
      elevation: 8,
      color: bubbleColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: isCurrentUser ? const Radius.circular(50) : Radius.zero,
              bottomLeft: const Radius.circular(50),
              bottomRight: const Radius.circular(50),
              topRight:
                  isCurrentUser ? Radius.zero : const Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app/src/screens/user_screens/chat/chat_screen.dart';
import 'package:chat_app/src/screens/user_screens/connect/connect_screen.dart';
import 'package:chat_app/src/screens/user_screens/profile/profile_screen.dart';
import 'package:chat_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Current index of the selected tab

  final List<Widget> _pages = [
    const ChatScreen(),
    const ConnectScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = ["Chats", "Connect with others", "Profile"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: _pages[_currentIndex], // Show the current page
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: isDarkTheme ? darkAccentColor : lightAccentColor,
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

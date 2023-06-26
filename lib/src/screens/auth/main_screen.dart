import 'package:chat_app/src/screens/auth/sign_in/signin_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: screenHeight*0.6),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                }, child: const Text("LOGIN"))),
                const SizedBox(width: 50,),
                Expanded(child: ElevatedButton(onPressed: (){}, child: const Text("SIGNUP"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
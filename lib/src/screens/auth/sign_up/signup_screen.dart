import 'package:chat_app/src/reusable_widgets/reusable_form_footer.dart';
import 'package:chat_app/src/screens/auth/sign_in/signin_screen.dart';
import 'package:chat_app/src/screens/auth/sign_up/signup_screen_widgets.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  color: Colors.yellow,
                ),
                const SignUpForm(),
                FormFooterWidget(text1: alreadyHaveAnAccount, text2: login.toUpperCase(),page: const SignIn(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

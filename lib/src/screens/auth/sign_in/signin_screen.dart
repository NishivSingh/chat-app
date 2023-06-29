import 'package:chat_app/src/reusable_widgets/reusable_form_footer.dart';
import 'package:chat_app/src/screens/auth/sign_in/signin_screen_widgets.dart';
import 'package:chat_app/src/screens/auth/sign_up/signup_screen.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.green,
              ),
              const LoginForm(),
              const FormFooterWidget(text1: dontHaveAnAccount,text2:signUp,page: SignUp(),)
            ],
          ),
        ),
      ),
    );
  }
}
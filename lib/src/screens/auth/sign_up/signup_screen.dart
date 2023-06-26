import 'package:chat_app/src/reusable_widgets/reusable_form_footer.dart';
import 'package:chat_app/src/screens/auth/sign_up/signip_screen_widgets.dart';
import 'package:chat_app/src/utils/constants/size.dart';
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
                const FormFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

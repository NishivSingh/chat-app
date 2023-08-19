import 'package:chat_app/src/reusable_widgets/reusable_form_footer.dart';
import 'package:chat_app/src/screens/auth/sign_in/signin_screen_widgets.dart';
import 'package:chat_app/src/screens/auth/sign_up/signup_screen.dart';
import 'package:chat_app/src/utils/constants/images.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultSize, vertical: defaultSize / 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: const AssetImage(logInImage),
                      height: size.height * 0.3,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LoginForm(),
                const FormFooterWidget(
                  text1: dontHaveAnAccount,
                  text2: signUp,
                  page: SignUp(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

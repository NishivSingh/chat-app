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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(size.height * 0.3)),
                child: const Image(
                  image: AssetImage(logInImage),
                  // height: size.height * 0.3,
                ),
              ),
              SizedBox(
                height: 20,
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
    );
  }
}

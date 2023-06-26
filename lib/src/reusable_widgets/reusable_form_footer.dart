import 'package:chat_app/src/utils/constants/images.dart';
import 'package:flutter/material.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("OR"),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20,
            ),
            label: const Text("Sign-In with Google")),
      ),
      const SizedBox(
        height: 10,
      ),
      TextButton(
          onPressed: () {},
          child:Text.rich(
            TextSpan(text: "Don't have an account? ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: const [
              TextSpan(text: "Signup", style: TextStyle(color: Colors.blue))
            ]),
          ))
    ],
  );

  }
}
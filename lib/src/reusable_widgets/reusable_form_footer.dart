import 'package:chat_app/src/utils/constants/images.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class FormFooterWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget page;
  const FormFooterWidget ({super.key, required this.text1, required this.text2, required this.page});

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
            label: const Text(signInWithGoogle)),
      ),
      const SizedBox(
        height: 10,
      ),
      TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          child:Text.rich(
            TextSpan(text: text1,
            style: Theme.of(context).textTheme.bodyLarge,
            children:[
              TextSpan(text: text2, style: const TextStyle(color: Colors.blue))
            ]),
          ))
    ],
  );
  }
}
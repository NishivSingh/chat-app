import 'package:chat_app/src/utils/constants/images.dart';
import 'package:flutter/material.dart';

Form loginForm() {
  return Form(
      child: Container(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        const TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: "Email",
              hintText: "Email",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: "Password",
              hintText: "Password",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {}, child: const Text("Forget password?"))),
        SizedBox(height: 10,),
        SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: const Text("LOGIN"))),
      ],
    ),
  ));
}

Column loginFooterWidget() {
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
            icon: const Image(image: AssetImage(tGoogleLogoImage),width: 20,),
            label: const Text("Sign-In with Google")),
      ),
      const SizedBox(
        height: 10,
      ),
      TextButton(
          onPressed: () {},
          child: const Text.rich(
            TextSpan(text: "Don't have an account? ", children: [
              TextSpan(text: "Signup", style: TextStyle(color: Colors.blue))
            ]),
          ))
    ],
  );
}

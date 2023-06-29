import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        const TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: email,
              hintText: email,
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: password,
              hintText: password,
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
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (context)=>Container(
                    padding: const EdgeInsets.all(defaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(forgetPasswordTitle)
                      ],
                    ),
                  ));
                }, child: const Text(forgetPassword))),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: Text(login.toUpperCase()))),
      ],
    ),
  ));
  }
}
import 'package:chat_app/src/reusable_widgets/reusable_buttons.dart';
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
                  showModalBottomSheet(context: context,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    builder: (context)=>Container(
                    padding: const EdgeInsets.all(defaultSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(forgetPasswordTitle,style: Theme.of(context).textTheme.displayMedium,),
                        Text(forgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 30,),
                        const ResendButton(buttonIcon: Icons.mail_outline_rounded,title: email,subTitle: resetViaEMail,),
                        const SizedBox(height: 20,),
                        const ResendButton(buttonIcon: Icons.mobile_friendly_rounded,title: phoneNo,subTitle: resetViaPhone,),

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


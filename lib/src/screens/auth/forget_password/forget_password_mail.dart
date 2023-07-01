import 'package:chat_app/src/screens/auth/forget_password/forget_password_otp.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMail  extends StatelessWidget {
  const ForgetPasswordMail ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 200,color: Colors.blue,),
                const SizedBox(height: 20,),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(email),
                          hintText: email,
                          prefixIcon: Icon(Icons.mail_outline_rounded)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: 
                        (context) => const OtpScreen()));}, child: const Text(next)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
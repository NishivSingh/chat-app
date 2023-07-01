import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPhone  extends StatelessWidget {
  const ForgetPasswordPhone ({super.key});

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
                          label: Text(phoneNo),
                          hintText: phoneNo,
                          prefixIcon: Icon(Icons.numbers)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){}, child: const Text(next)),
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
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(height: 200,color: Colors.green,),
              Form(child: 
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Email",
                        hintText: "Email",
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.fingerprint),
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){} ,child: Text("Forget your password?"))),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
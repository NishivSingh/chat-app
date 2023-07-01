import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(otpTitle, style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
            ),
            const SizedBox(height: 10,),
            Center(child: Text(otpSubTitle , style: Theme.of(context).textTheme.titleLarge,)),
            const SizedBox(height: 40,),
            const Text('$otpMessage dummymail@gmail.com',textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black12,
              filled: true,
            ),
            const SizedBox(height: 20,),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text(next)),),
          ],
        ),
      ),
    ));
  }
}
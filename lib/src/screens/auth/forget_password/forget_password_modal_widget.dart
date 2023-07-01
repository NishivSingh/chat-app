import 'package:chat_app/src/reusable_widgets/reusable_buttons.dart';
import 'package:chat_app/src/screens/auth/forget_password/forget_password_mail.dart';
import 'package:chat_app/src/screens/auth/forget_password/forget_password_phone.dart';
import 'package:chat_app/src/utils/constants/size.dart';
import 'package:chat_app/src/utils/constants/text.dart';
import 'package:flutter/material.dart';

class ForgetPassword{
static Future<void> forgetPasswordModal(BuildContext context) async {
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
          const ResetButton(buttonIcon: Icons.mail_outline_rounded,title: email,subTitle: resetViaEMail,page: ForgetPasswordMail(),),
          const SizedBox(height: 20,),
          const ResetButton(buttonIcon: Icons.mobile_friendly_rounded,title: phoneNo,subTitle: resetViaPhone,page: ForgetPasswordPhone(),),
        ],
      ),
    ));
}
}
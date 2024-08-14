import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wynk_clone/initial_page/otp_validation/ui/otp_screen.dart';

import '../../../../data/repositories/controllers/signup_controller.dart';
import '../../../../responsive/responiveness.dart';
import '../../../../utils.dart';

Widget mobileLastTextSpan(underlinedText) {
  return Row(
    children: [
      const Text(' and ', style: listViewText),
      InkWell(
        onTap: () {},
        child: Text(
          'Privacy Policy',
          style: underlinedText,
        ),
      )
    ],
  );
}

TextSpan desktopLastTextSpan(underlinedText) {
  return TextSpan(children: [
    const TextSpan(text: ' and ', style: listViewText),
    TextSpan(
        text: 'Privacy Policy',
        style: underlinedText,
        recognizer: TapGestureRecognizer()..onTap = () {})
  ]);
}

Widget textspan(context, underlinedText) {
  const String verificationId = '';
  final controller = Get.put(SignUpController());

  String selectCountryCode = "+91";
  return Text.rich(TextSpan(
    children: [
      const TextSpan(
          text: 'By creating an account, you agree to the Wynk ',
          style: listViewText),
      TextSpan(
          text: 'Terms of Use',
          style: underlinedText,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: OTPScreen(
                          mobileNumber:
                              '$selectCountryCode ${controller.phoneNo.text}',
                          verificationId: verificationId),
                      type: PageTransitionType.theme,
                      duration: const Duration(seconds: 1)));
            }),
      (Responsiveness.isMobile(context))
          ? WidgetSpan(child: Center(child: mobileLastTextSpan(underlinedText)))
          : desktopLastTextSpan(underlinedText),
    ],
  ));
}

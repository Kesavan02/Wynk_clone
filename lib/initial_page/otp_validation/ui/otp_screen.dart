import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wynk_clone/initial_page/language_selection/ui/language_select.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen(
      {super.key, required this.mobileNumber, required this.verificationId});

  final tOtpSubtitle = 'OTP';
  final String mobileNumber;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final otpController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CODE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(
              tOtpSubtitle.toUpperCase(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 40.0,
            ),
            OtpTextField(
              handleControllers: (controllers) => otpController,
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: otpController.text);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const LanguageSelection(),
                            type: PageTransitionType.theme,
                            duration: const Duration(seconds: 1)));
                  },
                  child: Text('Next'.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}

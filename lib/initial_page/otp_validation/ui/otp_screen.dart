import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wynk_clone/initial_page/language_selection/ui/language_select.dart';
import 'package:wynk_clone/responsive/responiveness.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen(
      {super.key, required this.mobileNumber, required this.verificationId});

  final String mobileNumber;
  final String verificationId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final tOtpSubtitle = 'Enter your OTP code';

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final otpController = TextEditingController();
    return Padding(
      padding: Responsiveness.isMobile(context)
          ? const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30)
          : const EdgeInsets.only(left: 250, right: 250, top: 100, bottom: 100),
      child: Dialog(
        elevation: 5,
        backgroundColor: Colors.grey,
        insetAnimationDuration: const Duration(seconds: 1),
        insetPadding: const EdgeInsets.all(10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/animations/anim_otp.json',
                height: 250,
                width: 250,
                fit: BoxFit.fill,
              ),
              Text(
                tOtpSubtitle,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
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
                              verificationId: widget.verificationId,
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
                    child: const Text('Next')),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

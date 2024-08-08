import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../language_selection/ui/flutter_toast.dart';
import '../../otp_validation/ui/otp_screen.dart';

otpValidationDialogBox(context, controller, selectCountryCode) async {
  if (controller.phoneNo.text.length == 10) {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: selectCountryCode + controller.phoneNo.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
            context,
            PageTransition(
              child: Dialog(
                  elevation: 5,
                  backgroundColor: Colors.grey,
                  insetAnimationDuration: const Duration(seconds: 1),
                  insetPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  insetAnimationCurve: Curves.easeInOut,
                  child: OTPScreen(
                      mobileNumber:
                          '$selectCountryCode ${controller.phoneNo.text}',
                      verificationId: verificationId)),
              type: PageTransitionType.theme,
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } else {
    FlutterToastMessage toast = FlutterToastMessage();
    toast.flutterToast('Enter a valid mobile number.');
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:wynk_clone/initial_page/language_selection/ui/language_select.dart';
import 'package:wynk_clone/initial_page/mobileno_details/bloc/mobileno_details_bloc.dart';
import 'package:wynk_clone/initial_page/otp_validation/ui/otp_screen.dart';
import 'package:wynk_clone/utils.dart';

import '../../../data/repositories/controllers/signup_controller.dart';

class MobileNoDetails extends StatelessWidget {
  const MobileNoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    String selectCountryCode = "+91";
    MobileNumberDetailsBloc mobileNumberDetailsBloc = MobileNumberDetailsBloc();

    const underlinedtext = TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
      decorationThickness: 2,
      decorationStyle: TextDecorationStyle.wavy,
    );

    return BlocConsumer(
      bloc: mobileNumberDetailsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .11,
                          child: Image.asset(
                            "lib/icons/common/back-arrow.png",
                            height: MediaQuery.of(context).size.height * .09,
                            width: MediaQuery.of(context).size.width * .09,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 6,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const LanguageSelection()));
                          },
                          child: const Text(
                            'SKIP',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Enter your mobile number',
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: controller.phoneNo,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    style: optionsText,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        filled: true,
                        fillColor: const Color.fromARGB(20, 80, 80, 80),
                        hintText: 'Mobile number',
                        hintStyle:
                            const TextStyle(fontSize: 15.0, color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 450,
                  ),
                  Wrap(
                    children: [
                      const Text(
                        'By creating an account, you agree to the Wynk ',
                        style: listViewText,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Terms of Use',
                          style: underlinedtext,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            ' and ',
                            style: listViewText,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Privacy Policy',
                              style: underlinedtext,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .85,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (controller.phoneNo.text.length == 10) {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber:
                                    selectCountryCode + controller.phoneNo.text,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OTPScreen(
                                                mobileNumber:
                                                    selectCountryCode +
                                                        controller.phoneNo.text,
                                                verificationId: verificationId,
                                              )));
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            'Next',
                            style: optionsText,
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wynk_clone/initial_page/language_selection/ui/language_select.dart';
import 'package:wynk_clone/initial_page/mobileno_details/bloc/mobileno_details_bloc.dart';
import 'package:wynk_clone/initial_page/mobileno_details/ui/widgets/custom_widgets.dart';
import 'package:wynk_clone/responsive/responiveness.dart';
import 'package:wynk_clone/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:wynk_clone/initial_page/mobileno_details/utils/functions.dart';

import '../../../data/repositories/controllers/signup_controller.dart';

class MobileNoDetails extends StatefulWidget {
  const MobileNoDetails({super.key});

  @override
  State<MobileNoDetails> createState() => _MobileNoDetailsState();
}

class _MobileNoDetailsState extends State<MobileNoDetails> {
  final controller = Get.put(SignUpController());

  String selectCountryCode = "+91";

  TextStyle underlinedText = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
    decorationThickness: 2,
    decorationStyle: TextDecorationStyle.wavy,
  );

  @override
  Widget build(BuildContext context) {
    MobileNumberDetailsBloc mobileNumberDetailsBloc = MobileNumberDetailsBloc();

    return BlocConsumer(
      bloc: mobileNumberDetailsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 2, bottom: 5, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Responsiveness.isMobile(context) ? Colors.black : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "lib/icons/common/back-arrow.png",
                      height: Responsiveness.isMobile(context) ? 30 : 60,
                      width: Responsiveness.isDesktop(context) ? 30 : 60,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(PageTransition(
                            child: const LanguageSelection(),
                            type: PageTransitionType.theme,
                            duration: const Duration(seconds: 1)));
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
              Center(
                heightFactor: 0.7,
                child: LottieBuilder.asset(
                  frameRate: FrameRate.max,
                  'assets/animations/anim-mobileno.json',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              const Text(
                'Enter your mobile number',
                style: subHeading,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: (Responsiveness.isMobile(context)) ? null : 500,
                  child: TextFormField(
                    controller: controller.phoneNo,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    style: optionsText,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        filled: true,
                        fillColor: const Color.fromARGB(56, 181, 178, 178),
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
                ),
              ),
              const Spacer(
                flex: 14,
              ),
              Center(
                child: textspan(context, underlinedText),
              ),
              const Spacer(
                flex: 2,
              ),
              Center(
                child: SizedBox(
                  height: (Responsiveness.isPortrait(context))
                      ? Responsiveness.isMobile(context)
                          ? 40
                          : 60
                      : Responsiveness.isMobile(context)
                          ? 40
                          : 60,
                  width: (Responsiveness.isPortrait(context))
                      ? Responsiveness.width(context) * .75
                      : Responsiveness.width(context) * .35,
                  child: ElevatedButton(
                      onPressed: () async {
                        otpValidationDialogBox(
                            context, controller, selectCountryCode);
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
        );
      },
    );
  }
}

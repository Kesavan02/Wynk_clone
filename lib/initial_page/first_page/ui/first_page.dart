import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/initial_page/first_page/bloc/firstpage_bloc.dart';
import 'package:wynk_clone/responsive/responiveness.dart';
import 'package:wynk_clone/utils.dart';
import 'first_page_widgets.dart';

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});

  @override
  State<MobileNo> createState() => _MobileNoState();
}

class _MobileNoState extends State<MobileNo> {
  FirstpageBloc firstPageBloc = FirstpageBloc();
  final String mobileNumber = "";
  final String verificationId = "";

  var height = 0.0;
  var width = 0.0;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    height;
    width;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return BlocConsumer(
      bloc: firstPageBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/background_mobileno.jpg")),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.0, 0.94],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 9,
                        ),
                        Text(
                          '$height, $width',
                          style: TextStyle(color: Colors.white),
                        ),
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(45.0), // Image radius
                            child: Image.asset('lib/icons/wynk 2.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                            'All our music in one place. Listen anytime,anywhere',
                            style: subHeading,
                          )),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  Responsiveness.isMobile(context)
                                      ? Navigator.push(context,
                                          navigationIsMobileOnPressed())
                                      : navigationIsTabletAndDesktopOnPressed(
                                          context,
                                          Responsiveness.isTablet(context)
                                              ? const EdgeInsets.only(
                                                  top: 100,
                                                  bottom: 100,
                                                  left: 250,
                                                  right: 250)
                                              : Responsiveness.isDesktop(
                                                      context)
                                                  ? const EdgeInsets.only(
                                                      top: 100,
                                                      bottom: 100,
                                                      left: 250,
                                                      right: 250)
                                                  : null);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  elevation: 5,
                                  animationDuration: const Duration(seconds: 1),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Continue with Mobile Number',
                                  style: optionsText,
                                )),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
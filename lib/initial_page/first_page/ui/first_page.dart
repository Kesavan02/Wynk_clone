import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/initial_page/first_page/bloc/firstpage_bloc.dart';
import 'package:wynk_clone/utils.dart';
import 'package:wynk_clone/initial_page/mobileno_details/ui/mobileno_details.dart';

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});

  @override
  State<MobileNo> createState() => _MobileNoState();
}

class _MobileNoState extends State<MobileNo> {
  FirstpageBloc firstpageBloc = FirstpageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: firstpageBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
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
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 8,
                      ),
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: Image.asset('lib/icons/wynk 2.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Spacer(),
                      const Center(
                          child: Text(
                        'All our music in one place. Listen anytime,anywhere',
                        style: subHeading,
                      )),
                      const Spacer(
                        flex: 1,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MobileNoDetails()));
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
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

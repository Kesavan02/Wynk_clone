import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wynk_clone/initial_page/artist_page/ui/artists.dart';
import 'package:flutter/material.dart';
import 'package:wynk_clone/initial_page/language_selection/bloc/language_selection_bloc.dart';
import 'package:wynk_clone/initial_page/language_selection/ui/flutter_toast.dart';
import 'package:wynk_clone/responsive/responiveness.dart';
import 'package:wynk_clone/utils.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => LanguageSelectionState();
}

class LanguageSelectionState extends State<LanguageSelection> {
  HashSet selectedItem = HashSet();
  bool isMultiSelectionEnabled = false;

  LanguageSelectionBloc languageSelectionBloc = LanguageSelectionBloc();
  FlutterToastMessage toast = FlutterToastMessage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: languageSelectionBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 6,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'What songs do you like?',
                    style: subHeading,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Center(
                  child: Text(
                    isMultiSelectionEnabled
                        ? getHeaderCountText()
                        : 'No artists were selected',
                    style: optionsText,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: MediaQuery.of(context).size.height * .79,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if (!isMultiSelectionEnabled) {
                            isMultiSelectionEnabled = true;
                          }
                          doMultiSelection(index);
                        },
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: list[index].withOpacity(1),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                                child: Text(
                              listLanguage[index],
                              style: optionsText,
                            )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(
                                  selectedItem.contains(index) ? 0.3 : 0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          Visibility(
                              visible: selectedItem.contains(index),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Image(
                                  image:
                                      AssetImage('lib/icons/common/check.png'),
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                ),
                              )),
                        ]),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (Responsiveness.isPortrait(context)) ? 2 : 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 100),
                  ),
                ),
                const Spacer(),
                Center(
                  heightFactor: 1,
                  child: SizedBox(
                    height: (Responsiveness.isPortrait(context))
                        ? MediaQuery.of(context).size.height * .06
                        : MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .65,
                    child: ElevatedButton(
                        onPressed: () {
                          selectedItem.length <= 1
                              ? toast.flutterToast(
                                  'select ${2 - selectedItem.length} more language')
                              : Navigator.of(context).push(PageTransition(
                                  child: const ArtistsSelection(),
                                  type: PageTransitionType.theme,
                                  duration: const Duration(seconds: 1)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: selectedItem.length >= 2
                                ? Colors.blue
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
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
        );
      },
    );
  }

  void doMultiSelection(int index) {
    if (isMultiSelectionEnabled) {
      setState(() {
        if (selectedItem.contains(index)) {
          selectedItem.remove(index);
        } else {
          selectedItem.add(index);
        }
      });
    } else {
      //
    }
  }

  String getHeaderCountText() {
    return selectedItem.isNotEmpty
        ? "${selectedItem.length} languages selected"
        : "No languages are Selected";
  }

  final List<String> listLanguage = [
    "Tamil",
    "Telugu",
    "English",
    "Hindi",
    "Punjabi",
    "Bhojpuri",
    "Bengali",
    "Malayalam",
    "Gujarati",
    "Rajasthani",
    "Marathi",
    "Odia",
    "Assamese",
    "Kannada",
    "Haryanavi"
  ];
}

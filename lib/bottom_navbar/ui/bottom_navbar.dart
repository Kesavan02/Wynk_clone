import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wynk_clone/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:wynk_clone/hellotune_page/ui/hellotune_page.dart';
import 'package:wynk_clone/home/ui/home.dart';
import 'package:wynk_clone/about.dart';
import 'package:wynk_clone/mymusic/ui/my_music.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  BottomNavbarBloc bottomNavbarBloc = BottomNavbarBloc();

  @override
  void initState() {
    // TODO: implement initState
    bottomNavbarBloc.add(BottomNavbarInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bottomNavbarBloc,
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          body: listOfWidgets[_currentIndex],
          bottomNavigationBar: SalomonBottomBar(
              margin: const EdgeInsets.all(2),
              itemPadding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              backgroundColor: Colors.black,
              selectedColorOpacity: 0.2,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (int _index) {
                setState(() {
                  _currentIndex = _index;
                });
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.home_rounded,
                    size: 30,
                  ),
                  title: const Text("Home"),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.music_note_rounded),
                  title: const Text(
                    'My Music',
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.library_music_rounded),
                  title: const Text("Hellotunes"),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.info_rounded),
                  title: const Text("Go Premium"),
                ),
              ]),
        );
      },
    );
  }

  List<Widget> listOfWidgets = [
    const HomePage(),
    const MyMusicPage(),
    const HelloTunePage(),
    const AboutWynk(),
  ];
}

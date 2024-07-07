import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wynk_clone/home/bloc/home_bloc.dart';
import 'package:wynk_clone/home/ui/widgets.dart';

import 'package:wynk_clone/player_list.dart';

import '../../demo.dart';
import '../../utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _player = AudioPlayer();
  int index = 0;

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.2],
              colors: [Colors.pinkAccent, Colors.black],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.0,
                  0.16,
                  0.8,
                  1.1
                ],
                colors: [
                  Color(0xffffffff),
                  Colors.transparent,
                  Colors.transparent,
                  Color(0x5EB2F5FF)
                ]),
          ),
        ),
        BlocConsumer(
          bloc: homeBloc,
          listener: (context, state) {
            if (state is HomeNotificationButtonNavigateClickedState) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PlayerList()));
            } else if (state is HomeSearchButtonClickedState) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DemoPage()));
            } else if (state is MusicPlayableCardsClickedState) {}
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaHeight * 0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: mediaHeight * .09,
                        child: CircleAvatar(
                          maxRadius: 50,
                          child: ClipOval(
                              child: Image.asset("lib/icons/wynk modify.png")),
                        ),
                      ),
                      const Spacer(
                        flex: 9,
                      ),
                      IconButton(
                        onPressed: () {
                          homeBloc.add(HomeSearchButtonClickedEvent());
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {
                          homeBloc.add(
                              HomeNotificationButtonNavigateClickedEvent());
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaHeight * .02,
                  ),
                  rowOnTopOfSongsList(homeBloc, 'Top Hits', () {}),
                  SizedBox(
                    height: mediaHeight * .001,
                  ),
                  cardViewBuilder(context),
                  SizedBox(
                    height: mediaHeight * .01,
                  ),
                  rowOnTopOfSongsList(homeBloc, 'Featured Today', () {}),
                  SizedBox(
                    height: mediaHeight * .001,
                  ),
                  playableCardListBuilder(
                      homeBloc, context, moviePosters.length),
                  SizedBox(
                    height: mediaHeight * .01,
                  ),
                  rowOnTopOfSongsList(
                      homeBloc, 'Your Personalized Mixes', () {}),
                  SizedBox(
                    height: mediaHeight * .001,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: moviePosters.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return movieSongsCardListBuilder(moviePosters[index],
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PlayerList()));
                        }, index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  rowOnTopOfSongsList(homeBloc, 'Latest Tamil', () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  playableCardListBuilder(
                      homeBloc, context, moviePosters.length)
                ],
              ),
            );
          },
        ),
      ],
    ));
  }

  Future<void> _setupAudioPlayer(AudioSourceOption option) async {
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stacktrace) {
      print("A stream error occurred: $e");
    });
    try {
      if (option == AudioSourceOption.Asset) {
        await _player.setAudioSource(AudioSource.asset("audios/Sandhanam.mp3"));
      }
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }
}

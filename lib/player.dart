import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wynk_clone/utils.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

enum AudioSourceOption { Network, Asset }

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Color white = Colors.white;
  final _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "lib/icons/common/back-arrow.png",
                          height: MediaQuery.of(context).size.height * .09,
                          width: MediaQuery.of(context).size.width * .09,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Playing from',
                            style: listViewText,
                          ),
                          Text(
                            'Madharasapattinam',
                            style: optionsText,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                listViewHorizontal(),
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        const SizedBox(
                          height: 370,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              height: 200,
                              width: MediaQuery.of(context).size.width * .85,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Music name',
                                    style: subHeading,
                                  ),
                                  ScrollLoopAutoScroll(
                                      scrollDirection: Axis.horizontal,
                                      duplicateChild: 5,
                                      gap: 150,
                                      child: Text(
                                        '77.1 plays Ravi Basrur, Krishna Kanth, Ravi Basrur and Team - Prathi Gaadhalo (From "Salaar Cease Fire - Telugu")',
                                        style: optionsText,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 3),
                              height: 217,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  customIconButtons(
                                      "lib/icons/common/menu.png", () {}),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  customIconButtons(
                                      "lib/icons/common/like.png", () {}),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  customIconButtons(
                                      "lib/icons/common/share.png", () {}),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  customIconButtons(
                                      "lib/icons/common/download.png", () {}),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => _setupAudioPlayer(AudioSourceOption.Asset),
                      child: Container(
                        height: 600,
                        width: double.maxFinite,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Center(
                            child: Text('First click here to play the song')),
                      ),
                    ),
                  ],
                ),
                _progessBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                        color: white,
                      ),
                    ),
                    _playbackControlButton(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                        color: white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> list = [
    'My Radio',
    'Romantic',
    'Sad',
    'Workout',
    'Party',
    '90\'s',
    'My Top Songs'
  ];

  Widget listViewHorizontal() {
    return Container(
      height: 22,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 140, 138, 138),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    list[index],
                    style: optionsText,
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget customIconButtons(asset, method) {
    return InkWell(
      onTap: method,
      child: Image.asset(
        asset,
        height: 30,
        width: 30,
        color: Colors.white,
        fit: BoxFit.cover,
      ),
    );
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

  Widget _sourceSelect() {
    return SizedBox(
      width: 400,
      child: MaterialButton(
        height: 365,
        color: Colors.purpleAccent,
        child: const Text(
          "Asset",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _setupAudioPlayer(AudioSourceOption.Asset),
      ),
    );
  }

  Widget _progessBar() {
    return StreamBuilder<Duration?>(
      stream: _player.positionStream,
      builder: (context, snapshot) {
        return ProgressBar(
          progress: snapshot.data ?? Duration.zero,
          buffered: _player.bufferedPosition,
          total: _player.duration ?? Duration.zero,
          onSeek: (duration) {
            _player.seek(duration);
          },
        );
      },
    );
  }

  Widget _playbackControlButton() {
    return StreamBuilder<PlayerState>(
        stream: _player.playerStateStream,
        builder: (context, snapshot) {
          final processingState = snapshot.data?.processingState;
          final playing = snapshot.data?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 64,
              height: 64,
              child: const CircularProgressIndicator(),
            );
          } else if (playing != true) {
            return IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 64,
              onPressed: _player.play,
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 64,
              onPressed: _player.pause,
            );
          } else {
            return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64,
                onPressed: () => _player.seek(Duration.zero));
          }
        });
  }
}

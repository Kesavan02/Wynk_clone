import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/mymusic/bloc/mymusic_bloc.dart';
import 'package:wynk_clone/utils.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({super.key});

  @override
  State<MyMusicPage> createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  int index = 0;

  MyMusicBloc myMusicBloc = MyMusicBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: myMusicBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(-1.5, -1),
                      colors: [Color.fromARGB(255, 68, 94, 231), Colors.black],
                      stops: [0.0, 0.3]),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: Checkbox.width,
                            backgroundColor: Colors.lightBlue,
                            child: Text(
                              'KK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'My Music',
                            style: appBarTextStyle,
                          ),
                          const Spacer(
                            flex: 8,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search_rounded,
                                size: 40,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.builder(
                            padding:
                                const EdgeInsets.only(bottom: 0.1, top: 30),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: musicCardsImage.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    mainAxisExtent: 110),
                            itemBuilder: (context, index) {
                              return musicCards(
                                  musicCardsImage[index],
                                  musicCardsText[index],
                                  musicCardsSubText[index]);
                            }),
                      ),
                      rowOnTopOfSongsList(
                          myMusicBloc, 'Recently Played', () {}),
                      SizedBox(
                        height: 290,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            padding: const EdgeInsets.only(top: 0.1),
                            itemBuilder: (context, index) {
                              return myMusicSongsListView(
                                  'assets/background_mobileno.jpg',
                                  'djhfvaujhfvjhf',
                                  'kjkjbgdhhfiuhscfhshgfhbfjbkjbdkjfgsiejrh');
                            }),
                      ),
                      rowOnTopOfSongsList(
                          myMusicBloc, 'Your Most Played Songs', () {}),
                      playableCardListBuilder(
                          myMusicBloc, context, moviePosters.length),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<String> musicCardsImage = [
    'lib/icons/common/lockedblue.png',
    'lib/icons/common/download.png',
    'lib/icons/common/like.png',
    'lib/icons/common/playlist.png',
    'lib/icons/common/artist.png',
    'lib/icons/common/podcasts.png'
  ];

  List<String> musicCardsText = [
    'Downloads',
    'Local Mp3',
    'Liked Music',
    'Playlists',
    'Artists',
    'Podcasts'
  ];

  List<String> musicCardsSubText = [
    '0 songs',
    '',
    '0 songs',
    '0 playlists',
    '0 artists',
    '0 podcasts'
  ];
}

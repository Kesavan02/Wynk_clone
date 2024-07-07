import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/hellotune_page/ui/hellotune_card_widget.dart';
import 'package:wynk_clone/utils.dart';

import '../bloc/hellotune_bloc.dart';

class HelloTunePage extends StatefulWidget {
  const HelloTunePage({super.key});

  @override
  State<HelloTunePage> createState() => _HelloTunePageState();
}

class _HelloTunePageState extends State<HelloTunePage> {
  @override
  void initState() {
    hellotuneBloc = HellotuneBloc();
    hellotuneBloc.add(HellotuneInitialEvent());
    super.initState();
  }

  late final HellotuneBloc hellotuneBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HellotuneBloc, HellotuneState>(
      bloc: hellotuneBloc,
      listener: (context, state) {},
      builder: (context, state) {
        print(state.runtimeType);
        switch (state.runtimeType) {
          case HellotuneInitialState:
            return Scaffold(
              body: Container(
                color: Colors.black,
                padding: const EdgeInsets.only(left: 8.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'HelloTune',
                              style: appBarTextStyle,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowOnTopOfSongsList(hellotuneBloc, 'Just For You', () {}),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 205,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: moviePosters.length,
                            itemBuilder: (context, index) {
                              return HellotuneCardWidget(
                                  moviePosters: moviePosters[index],
                                  songTitle: 'songTitle',
                                  songSubtitle: 'songSubtitle of the song');
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          default:
            return build(context);
        }
      },
    );
  }
}

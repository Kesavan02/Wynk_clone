import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../player.dart';
import '../../utils.dart';

Widget movieSongsCardListBuilder(image, onTap, index) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              height: 130,
              width: 130,
              image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 150,
            width: 130,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.0, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Your',
                      style: subHeading,
                    ),
                    Text(
                      'Mix',
                      style: subHeading,
                    )
                  ],
                ),
                Text(
                  '${index + 1}',
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget cardViewBuilder(context) {
  return SizedBox(
    height: 150,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviePosters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * .88,
              height: MediaQuery.of(context).size.height * .17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: AssetImage(moviePosters[index]),
                      fit: BoxFit.cover),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.9],
                  )),
              child: Column(),
            ),
          );
        }),
  );
}

Widget rowOnTopOfSongsList<B extends BlocBase<S>, S>(
    B bloc, String initialText, VoidCallback onPressed) {
  return BlocBuilder<B, S>(
    bloc: bloc,
    builder: (context, state) {
      return SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              initialText,
              style: subHeading,
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'See all',
                style: normalSubHeading,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget playableCardListBuilder<B extends BlocBase<S>, S>(
    B bloc, BuildContext context, itemCount) {
  return BlocBuilder(
    bloc: bloc,
    builder: (context, state) {
      return SizedBox(
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Player()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.0, 0.5],
                          ),
                          image: DecorationImage(
                              image: AssetImage(moviePosters[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        alignment: const Alignment(1, 1),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Songs',
                        style: listViewText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

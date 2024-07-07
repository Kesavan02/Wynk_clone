import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:wynk_clone/utils.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.grey, Colors.black],
          stops: [0.2, 0.6],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'lib/icons/common/back-arrow.png',
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .1,
                      color: Colors.white,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Image.asset(
                    'assets/background_mobileno.jpg',
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width * .5,
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: () {
                      bottomSheet(
                          context, 'Harish', listTile1[0], listTile1[1], 1);
                    },
                    child: Image.asset(
                      'lib/icons/common/vertical_menu.png',
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .1,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: const ScrollLoopAutoScroll(
                    scrollDirection: Axis.horizontal,
                    duplicateChild: 5,
                    gap: 150,
                    child: Text(
                      '77.1 plays Ravi Basrur, Krishna Kanth, Ravi Basrur and Team - Prathi Gaadhalo (From "Salaar Cease Fire - Telugu")',
                      style: scrollTextStyle,
                    )),
              ),
              const Text(
                '30 songs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  columnWidgets(context, 'Play All', Icons.play_arrow_rounded),
                  columnWidgets(
                      context, 'Download All', Icons.download_rounded),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  columnIconText(
                      context, 'lib/icons/common/shuffle.png', 'Shuffle All'),
                  columnIconText(
                      context, 'lib/icons/common/download.png', 'Download All')
                ],
              ),
              listViewDesignForSongs(context, 'jdfhjdk', 'jfjksdkfjkjfkjsh')
            ],
          ),
        ),
      ),
    );
  }

  Widget columnIconText(context, image, text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .05,
            color: Colors.white,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget columnWidgets(context, buttonText, buttonIcon) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .45,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                backgroundColor: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  buttonIcon,
                  color: Colors.black,
                ),
                Text(
                  buttonText,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            )));
  }

  Widget listViewDesignForSongs(context, mainText, subText) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .45,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            padding:
                const EdgeInsets.only(left: 12.0, bottom: 15.0, right: 12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/background_mobileno.jpg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mainText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13)),
                    Text(subText,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10))
                  ],
                ),
                const Spacer(
                  flex: 7,
                ),
                Image.asset(
                  'lib/icons/common/download.png',
                  height: iconHeight,
                  width: iconWidth,
                  color: Colors.grey,
                ),
                const Spacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'lib/icons/common/vertical_menu.png',
                    height: iconHeight,
                    width: iconWidth,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List listTile1 = ['Save', 'lib/icons/common/back-arrow.png'];

List listTile2 = [
  'Add To Playlist',
  'lib/icons/common/back-arrow.png',
  'Like',
  'lib/icons/common/back-arrow.png',
  'Set As Hellotune',
  'lib/icons/common/back-arrow.png',
  'Add To Queue',
  'lib/icons/common/back-arrow.png',
  'Song info',
  'lib/icons/common/back-arrow.png',
  'Share',
  'lib/icons/common/back-arrow.png'
];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/player.dart';

const appBarTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white);

const subHeading = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const normalSubHeading = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);

const listViewText = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  color: Color(0xff898989),
);

const optionsText = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

TextStyle underlinedText = const TextStyle(
  color: Colors.blue,
  decoration: TextDecoration.underline,
  decorationColor: Colors.blue,
  decorationThickness: 2,
  decorationStyle: TextDecorationStyle.wavy,
);

const scrollTextStyle =
    TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold);

const double iconHeight = 20;
const double iconWidth = 20;

const linearGColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Colors.redAccent],
    stops: [0.0, 0.8]);

final List<Color> list = [
  Colors.green.withOpacity(0.9),
  Colors.orange,
  Colors.pinkAccent,
  Colors.grey,
  Colors.blue,
  Colors.orangeAccent,
  Colors.amber,
  Colors.red,
  Colors.purple,
  Colors.purpleAccent,
  Colors.green,
  Colors.tealAccent,
  Colors.brown,
  Colors.yellowAccent,
  Colors.lightGreenAccent
];

final List<String> assetImages = [
  'assets/background_mobileno.jpg',
  'assets/Splash_dark.jpg',
  'assets/Splash_light.jpg',
  'lib/icons/common/back-arrow.png',
  'lib/icons/common/check.png',
  'lib/icons/common/cross-button.png',
  'lib/icons/common/download.png',
  'lib/icons/common/like.png',
  'lib/icons/common/menu.png',
  'lib/icons/common/share.png',
  'lib/icons/common/shuffle.png',
  'lib/icons/common/vertical_menu.png',
  'lib/icons/wynk.png',
  'lib/icons/wynk modify.png',
  'lib/icons/wynk 2.png'
];

final List<String> moviePosters = [
  'assets/movie_posters/96.jpeg',
  'assets/movie_posters/_Aadukalam_ by Vetrimaran.jpeg',
  'assets/movie_posters/Alaipayuthey.jpeg',
  'assets/movie_posters/Bombay tamil movie 1995.jpeg',
  'assets/movie_posters/hridayam.jpeg',
  'assets/movie_posters/jailer.jpeg',
  'assets/movie_posters/japan_6.jpg',
  'assets/movie_posters/kaithi.jpeg',
  'assets/movie_posters/King Of Kotha.jpeg',
  'assets/movie_posters/LEO OCT 19 WORLDWIDE RELEASE.jpeg',
  'assets/movie_posters/Paiyaa.jpeg',
  'assets/movie_posters/Raaja paarvai.jpeg',
  'assets/movie_posters/Soorarai Pottru Poster.jpeg',
  'assets/movie_posters/vikram.jpeg'
];

Widget cardViewSongs(context, icon) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .12),
            width: MediaQuery.of(context).size.width * .25,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background_mobileno.jpg'),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  alignment: const Alignment(0.0, 0.7),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            )),
      ],
    ),
  );
}

Widget listTile(listText, assetIcon, itemCount) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return SizedBox(
        height: 65,
        child: ListTile(
          dense: true,
          style: ListTileStyle.list,
          tileColor: Colors.grey,
          iconColor: Colors.white,
          onTap: () {},
          contentPadding: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          leading: Image.asset(
            assetIcon,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          title: Text(
            listText,
            style: optionsText,
          ),
        ),
      );
    },
    padding: const EdgeInsets.all(10.0),
    itemCount: itemCount,
  );
}

void bottomSheet(context, singerName, listText, assetIcon, itemCount) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .34,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            children: [
              cardViewSongs(context, Icons.play_arrow_rounded),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Text(
                singerName,
                style: scrollTextStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              listOfBottomSheet(context, listText, assetIcon, itemCount),
            ],
          ),
        );
      });
}

Widget listOfBottomSheet(context, listText, assetIcon, itemCount) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'More options',
                style: subHeading,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'lib/icons/common/cross-button.png',
                  fit: BoxFit.cover,
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Expanded(child: listTile(listText, assetIcon, itemCount))
        ],
      ),
    ),
  );
}

List<String> musicCardsMainText = [
  'Downloads',
  'Local Mp3',
  'Liked music',
  'Playlists',
  'Artists',
  'Podcasts'
];

List<String> musicCardsSubText = [
  '${0} songs',
  '',
  '${0} songs',
  '${0} playlists',
  '${0} artists',
];

Widget musicCards(image, text, subText) {
  return InkWell(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color.fromARGB(210, 52, 51, 51)),
      height: 70,
      width: 150,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            image,
            width: 25,
            height: 25,
            color: Colors.white,
            fit: BoxFit.fitHeight,
          ),
          const Spacer(),
          Text(
            text,
            style: optionsText,
          ),
          const Spacer(),
          Text(
            subText,
            style: listViewText,
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    ),
  );
}

Widget myMusicSongsListView(image, title, subTitle) {
  return ListTile(
    onTap: () {},
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.asset(
        image,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
    subtitle: Text(
      subTitle,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    horizontalTitleGap: 15,
    trailing: InkWell(
      onTap: () {},
      child: Image.asset(
        'lib/icons/common/vertical_menu.png',
        height: 30,
        width: 30,
        fit: BoxFit.cover,
        color: Colors.white,
      ),
    ),
  );
}

Widget helloTuneSongsListView() {
  return Container();
}

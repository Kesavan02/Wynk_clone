import 'package:flutter/material.dart';

class HellotuneCardWidget extends StatelessWidget {
  const HellotuneCardWidget({
    super.key,
    required this.moviePosters,
    required this.songTitle,
    required this.songSubtitle,
  });

  final String moviePosters;
  final String songTitle;
  final String songSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          child: Image.asset(
            moviePosters,
            fit: BoxFit.cover,
            height: 140,
            width: 135,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white10,
              border:
                  Border.all(color: Colors.white12, style: BorderStyle.solid),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0))),
          width: 135,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  songSubtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  
}

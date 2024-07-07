import 'package:flutter/material.dart';

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
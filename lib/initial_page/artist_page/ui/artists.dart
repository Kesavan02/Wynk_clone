import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wynk_clone/initial_page/artist_page/bloc/artist_bloc.dart';
import 'package:wynk_clone/utils.dart';
import 'package:wynk_clone/initial_page/artist_page/data_fetch/json_fetch.dart';
import '../../../bottom_navbar/ui/bottom_navbar.dart';

class ArtistsSelection extends StatefulWidget {
  const ArtistsSelection({super.key});

  @override
  State<ArtistsSelection> createState() => ArtistsSelectionState();

  static GlobalKey<ArtistsSelectionState> createKey() =>
      GlobalKey<ArtistsSelectionState>();
}

class ArtistsSelectionState extends State<ArtistsSelection> {
  final TextEditingController searchController = TextEditingController();
  HashSet selectedItem = HashSet();
  bool isMultiSelectionEnabled = false;
  late Future<List<Map<String, dynamic>>> _data;

  ArtistBloc artistBloc = ArtistBloc();

  @override
  void initState() {
    super.initState();
    _data = ArtistFetch().dataFetch();
    artistBloc.add(ArtistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: artistBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: const BoxDecoration(color: Colors.black),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
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
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BottomNavBar()));
                          },
                          child: const Text(
                            'SKIP',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                ),
                const Text(
                  'Choose 3 or more artists you love',
                  style: subHeading,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Center(
                  child: Text(
                    isMultiSelectionEnabled ? getHeaderCountText() : '',
                    style: optionsText,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                TextField(
                  controller: searchController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  style: optionsText,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: const Color(0x384F4E4E),
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(fontSize: 15.0, color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .62,
                    child: listGridArtists()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .005,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .65,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomNavBar()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (selectedItem.length >= 2)
                              ? Colors.blue
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          )),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: optionsText,
                      ))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget listGridArtists() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final List<Map<String, dynamic>> commonData = snapshot.data!;

          return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 140),
              itemBuilder: (BuildContext context, index) {
                final item = commonData[index];
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (!isMultiSelectionEnabled) {
                            isMultiSelectionEnabled = true;
                          }
                          doMultiSelection(index);
                        },
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(item['image']),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(
                                      selectedItem.contains(index) ? 0.5 : 0),
                                  borderRadius: BorderRadius.circular(55)),
                            ),
                          ),
                          Visibility(
                            visible: selectedItem.contains(index),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const Spacer(),
                      Text(
                        item['name'],
                        style: listViewText,
                      )
                    ],
                  ),
                );
              });
        } else {
          return const Center(
            child: Text('No data'),
          );
        }
      },
    );
  }

  void doMultiSelection(int index) {
    if (isMultiSelectionEnabled) {
      setState(() {
        if (selectedItem.contains(index)) {
          selectedItem.remove(index);
        } else {
          selectedItem.add(index);
        }
      });
    } else {
      //
    }
  }

  String getHeaderCountText() {
    return selectedItem.isNotEmpty
        ? "${selectedItem.length} artists selected"
        : "No artists are Selected";
  }
}

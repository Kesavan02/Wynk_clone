import 'dart:convert';

import 'package:flutter/services.dart';

class ArtistFetch {
  final String filePath =
      'lib/initial_page/artist_page/data/artist_data.json';

  Future<List<Map<String, dynamic>>> dataFetch() async {
    final String loadData = await rootBundle.loadString(filePath);
    final List<dynamic> data = jsonDecode(loadData) as List<dynamic>;
    List<Map<String, dynamic>> result =
        data.map((item) => item as Map<String, dynamic>).toList();
    return result;
  }
}

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wynk_clone/initial_page/first_page/ui/first_page.dart';

Future<void> main() async {
  ///Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCBcabcOvJxyXuV4aP6iGO41VZaOR7-F2k",
            appId: "1:189109064550:android:40ab3ca31e866e2938aea7",
            messagingSenderId: "189109064550",
            projectId: "wynk-clone-9c148",
          ),
        )
      :

      ///Initialize Firebase & Authentication Repository
      await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MobileNo(),
    );
  }
}

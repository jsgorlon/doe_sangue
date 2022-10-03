// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:doe_sangue/views/android/userStats.page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoeSangue',
      theme: ThemeData.dark(),
      home: UserStatsPage(),
      routes: {
        '/userStats': (context) => UserStatsPage(),
      },
    );
  }
}

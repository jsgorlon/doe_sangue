// ignore_for_file: prefer_const_constructors

import 'package:doe_sangue/views/android/tabbedHome.page.dart';
import 'package:doe_sangue/views/android/login.page.dart';
import 'package:doe_sangue/views/android/profile.page.dart';
import 'package:doe_sangue/views/android/create_campanha.page.dart';
import 'package:doe_sangue/views/android/widgets/keyboard.dismisser.dart';
import 'package:flutter/material.dart';
import 'about.page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        title: 'DoeSangue',
        theme: ThemeData.dark(),
        home: LoginPage(),
        routes: {
          '/about': (context) => AboutPage(),
          '/createCampanha': (context) => CreateCampanha(),
          '/profile': (context) => ProfilePage(),
          '/home': (context) => TabbedHome(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:doe_sangue/views/android/android.app.dart';
import 'package:doe_sangue/views/ios/ios.app.dart';

void main() {
  runApp(Platform.isIOS ? IosApp() : AndroidApp());
}

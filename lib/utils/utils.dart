import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

String getRandomImageUrl() {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final randomNumber = Random().nextInt(100000); // 0부터 99999 사이의 랜덤 숫자 생성
  return "https://source.unsplash.com/random/300x300/?pet&$timestamp$randomNumber";
}

double getRandomWidth(double min, double max) {
  return min + Random().nextDouble() * (max - min);
}

bool isDarkMode(BuildContext context) {
  final _box = Hive.box("twitter_box");
  bool getDarkMode = _box.get("isDarkMode") ?? false;
  return getDarkMode;
}

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
        (error as FirebaseException).message ?? "Something wen't wrong.",
      ),
    ),
  );
}

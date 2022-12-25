import 'package:flutter/material.dart';
import 'package:wooden_fish/pages/home.dart';
import 'package:wooden_fish/pages/setting.dart';
import 'package:wooden_fish/pages/fozhu.dart';
import 'package:wooden_fish/pages/songbo.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/home', routes: {
    "/home": (context) => const Home(),
    "/setting": (context) => const Setting(),
    "/fozhu": (context) => const FoZhu(),
    "/songbo": (context) => const SongBo(),
  }));
}

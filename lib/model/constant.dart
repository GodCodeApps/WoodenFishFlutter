import 'package:flutter/material.dart';

class Constant {
  static const String countKey = "count_key";
  static const String musicKey = "music_key";
  static const String fishKey = "fish_key";
  static const dataList = [
    ColorFilter.mode(Colors.white, BlendMode.modulate),
    ColorFilter.srgbToLinearGamma(),
    ColorFilter.linearToSrgbGamma(),
    ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]),
    ColorFilter.matrix(
        <double>[0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]),
    ColorFilter.mode(Colors.deepPurpleAccent, BlendMode.modulate),
    ColorFilter.mode(Colors.green, BlendMode.modulate),
    ColorFilter.mode(Colors.tealAccent, BlendMode.modulate),
    ColorFilter.mode(Colors.teal, BlendMode.modulate),
    ColorFilter.mode(Colors.yellowAccent, BlendMode.modulate),
    ColorFilter.mode(Colors.amber, BlendMode.modulate),
    ColorFilter.mode(Colors.red, BlendMode.modulate),
    ColorFilter.mode(Colors.blue, BlendMode.modulate),
    ColorFilter.mode(Colors.blueGrey, BlendMode.modulate),
    ColorFilter.mode(Colors.white70, BlendMode.modulate),
    ColorFilter.mode(Colors.lightGreenAccent, BlendMode.modulate),
    ColorFilter.mode(Colors.indigo, BlendMode.modulate),

  ];
}

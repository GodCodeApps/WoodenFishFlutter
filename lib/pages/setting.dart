import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("设置")),
        body: Row(
          children: const [
            ColorFiltered(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              child: Image(
                  image: AssetImage("assets/muyu.png"),
                  fit: BoxFit.cover,
                  width: 40.0,
                  height: 40.0),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              child: Image(
                  image: AssetImage("assets/muyu.png"),
                  fit: BoxFit.cover,
                  width: 40.0,
                  height: 40.0),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              child: Image(
                  image: AssetImage("assets/muyu.png"),
                  fit: BoxFit.cover,
                  width: 40.0,
                  height: 40.0),
            ),
          ],
        ));
  }
}

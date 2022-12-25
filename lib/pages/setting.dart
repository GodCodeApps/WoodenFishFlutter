import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: const Text("设置"),
          backgroundColor: Colors.black26,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("经文播放", style: TextStyle(color: Colors.white)),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = !switchValue;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
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
              ),
            )
          ],
        ));
  }
}

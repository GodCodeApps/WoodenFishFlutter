import 'package:flutter/material.dart';
import 'package:wooden_fish/model/constant.dart';
import 'package:wooden_fish/model/storage.dart';

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
                          Storage.setBool(Constant.musicKey, switchValue);
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: const [
                  Text("解锁木鱼",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  height: 200.0,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    children: Constant.dataList
                        .map((item) => InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ColorFiltered(
                                  colorFilter: item,
                                  child: const Image(
                                      image: AssetImage("assets/muyu.png"),
                                      fit: BoxFit.cover,
                                      width: 40.0,
                                      height: 40.0),
                                ),
                              ),
                              onTap: () {
                                Storage.setInt(Constant.fishKey,
                                    Constant.dataList.indexOf(item));
                                Navigator.pop(context);
                              },
                            ))
                        .toList(),
                  )),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class SongBo extends StatefulWidget {
  const SongBo({Key? key}) : super(key: key);

  @override
  State<SongBo> createState() => _SongBoState();
}

class _SongBoState extends State<SongBo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.fill,
            )),
        Positioned(
            left: 20.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Image(
                image: AssetImage('assets/fanhui.png'),
                width: 20.0,
              ),
            )),
        const Positioned(
            right: 0,
            left: 0,
            top: 60.0,
            child: Text(
              "功德+300",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
            )),
        const Positioned(
            right: 0,
            bottom: 210.0,
            child: Image(
              image: AssetImage('assets/stick.png'),
              height: 180.0,
            )),
        const Positioned(
            bottom: 80.0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/bowl.png'),
              width: 200.0,
              height: 200.0,
            )),
      ],
    ));
  }
}

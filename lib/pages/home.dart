import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AudioPlayer audioPlayer;
  late final AnimationController gunziAnimalController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    gunziAnimalController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    animation = Tween<double>(begin: -0.1, end: 0.5).animate(gunziAnimalController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: Stack(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              const Positioned(
                  left: 0,
                  top: 90.0,
                  right: 0,
                  child: Text("功德+600",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold))),
              Positioned(
                  left: 0,
                  top: 300.0,
                  right: 0,
                  child: GestureDetector(
                      onTap: () {
                        var value = gunziAnimalController.value;
                        gunziAnimalController.forward(from: 0.0);
                        gunziAnimalController.forward(from: 0.3);
                        gunziAnimalController.animateTo(0.0);
                        setState(() {
                          audioPlayer.play(
                              "https://unwatermarker.cn/woodenFish/audio/muyu.mp3");
                        });
                      },
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children:  [
                            const Image(
                                image: AssetImage('assets/muyu.png'),
                                width: 280.0,
                                height: 380.0),
                            Positioned(
                                top: 0.0,
                                right: -20.0,
                                child:RotationTransition(
                                  turns: animation,
                                  child: const Image(
                                  image: AssetImage('assets/gunzi.png'),
                                  width: 180.0,
                                ),) )
                          ]))),
              Positioned(
                  top: 140.0,
                  left: 10.0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/setting");
                        },
                        child: const Image(
                          image: AssetImage('assets/my-s.png'),
                          width: 40.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/fozhu");
                        },
                        child: const Image(
                          image: AssetImage('assets/fz-s.png'),
                          width: 40.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/songbo");
                        },
                        child: const Image(
                          image: AssetImage('assets/sb-s.png'),
                          width: 40.0,
                        ),
                      )
                    ],
                  ))
            ]));
  }
  @override
  void dispose() {
    gunziAnimalController.dispose();
    super.dispose();
  }
}

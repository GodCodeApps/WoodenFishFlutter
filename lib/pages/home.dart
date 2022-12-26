import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lifecycle_aware/lifecycle.dart';
import 'package:flutter_lifecycle_aware/lifecycle_observer.dart';
import 'package:flutter_lifecycle_aware/lifecycle_owner.dart';
import 'package:flutter_lifecycle_aware/lifecycle_state.dart';
import 'package:wooden_fish/model/constant.dart';
import 'package:wooden_fish/model/storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin, Lifecycle, LifecycleObserver {
  late final AudioPlayer audioPlayer;
  late final AudioPlayer musicPlayer;
  late final AnimationController gunziAnimalController;
  late final Animation<double> animation;
  int count = 0;
  late ColorFilter colorFilter = Constant.dataList.elementAt(0);

  getData() async {
    int fish = await Storage.getInt(Constant.fishKey);
    ColorFilter color = Constant.dataList.elementAt(fish);
    setState(() {
      colorFilter = color;
    });
    int s = await Storage.getInt(Constant.countKey);
    setState(() {
      count = s;
    });
    bool music = await Storage.getBool(Constant.musicKey);
    if (music) {
      musicPlayer.stop();
      musicPlayer
          .play("https://unwatermarker.cn/woodenFish/audio/dabeizou.mp3");
    } else {
      musicPlayer.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    getLifecycle().addObserver(this);
    // Storage.getInt(Constant.countKey).then((value) => {count = value});
    audioPlayer = AudioPlayer();
    musicPlayer = AudioPlayer();
    gunziAnimalController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    animation =
        Tween<double>(begin: -0.1, end: 0.5).animate(gunziAnimalController);
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
              Positioned(
                  left: 0,
                  top: 90.0,
                  right: 0,
                  child: Text("功德+$count",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                          count += 1;
                          Storage.setInt(Constant.countKey, count);
                        });
                      },
                      child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            ColorFiltered(
                              colorFilter: colorFilter,
                              child: const Image(
                                  image: AssetImage("assets/muyu.png"),
                                  width: 280.0,
                                  height: 380.0),
                            ),
                            Positioned(
                                top: 0.0,
                                right: -20.0,
                                child: ColorFiltered(
                                  colorFilter: colorFilter,
                                  child: RotationTransition(
                                    turns: animation,
                                    child: const Image(
                                      image: AssetImage('assets/gunzi.png'),
                                      width: 180.0,
                                    ),
                                  ),
                                ))
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
    audioPlayer.stop();
    gunziAnimalController.dispose();
    super.dispose();
  }

  @override
  void onLifecycleChanged(LifecycleOwner owner, LifecycleState state) {
    if (state == LifecycleState.onResume) {
      getData();
    }
  }
}

import 'dart:async';
import 'package:flappy/bird.dart';
import 'package:flutter/material.dart';
import 'barriers.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  bool gameHasStarted = false;
  double barrierXone = 0;
  double barrierXtwo = 1.5;
  double initialHeight = 0;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    var initialHeight = birdYaxis;
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        barrierXone -= 0.05;
        barrierXtwo -= 0.05;
        birdYaxis = initialHeight - height;
      });
      setState(() {
        if (barrierXone < -1.1) {
          barrierXone += 2.2;
        } else {
          barrierXone -= 0.05;
        }
      });
      setState(() {
        if (barrierXtwo < -1.1) {
          barrierXone += 2.2;
        } else {
          barrierXtwo -= 0.05;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
        birdYaxis = 0;
        initialHeight = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (gameHasStarted) {
                          jump();
                        } else {
                          startGame();
                        }
                      },
                      child: AnimatedContainer(
                        alignment: Alignment(0, birdYaxis),
                        duration: const Duration(milliseconds: 0),
                        color: Colors.blue,
                        child: const MyBird(),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                        alignment: const Alignment(0, -0.3),
                        child: gameHasStarted
                            ? const Text("")
                            : const Text(
                                " TAP TO PLAY",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 180.0),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 160.0),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, 1.3),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 160.0),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, -1.2),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 160.0),
                    )
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
                    color: const Color.fromARGB(255, 168, 58, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: const [Text("SCORE"), Text("0")]),
                        Column(children: const [Text("best"), Text("10")]),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

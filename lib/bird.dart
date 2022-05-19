import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('lib/images/flappy_image.png'),
    );
  }
}

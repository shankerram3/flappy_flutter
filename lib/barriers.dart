import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBarrier extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final size;

  // ignore: use_key_in_widget_constructors
  const MyBarrier({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: size,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 5, 240, 83),
        border: Border.all(width: 10, color: Colors.green.shade800),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.red;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 400),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onChange(),
        child: const Icon(Icons.play_circle_filled),
      ),
    );
  }

  void onChange() {
    final random = Random();
    width = random.nextInt(300).toDouble() + 50;
    height = random.nextInt(300).toDouble() + 50;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    setState(() {});
  }
}

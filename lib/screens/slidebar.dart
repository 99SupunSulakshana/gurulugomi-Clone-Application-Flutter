// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
//import 'package:wave/config.dart';
//import 'package:wave/wave.dart';

class Check extends StatefulWidget {
  Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WaveWidget(
        config: CustomConfig(
          gradients: [
            //[Colors.white, Colors.pinkAccent],
            [Colors.white, Colors.pinkAccent],
            [Colors.white, Colors.white],
            [Colors.white, Colors.yellow],
          ],
          gradientBegin: Alignment.centerLeft,
          gradientEnd: Alignment.centerRight,
          durations: [10900000, 11000000, 6000000],
          heightPercentages: [0.20, 0.25, 0.26],
          // blur: MaskFilter.blur(BlurStyle.solid, 2)
        ),
        size: Size(double.infinity, double.infinity),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

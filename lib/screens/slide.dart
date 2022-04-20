// ignore_for_file: prefer_const_constructors_in_immutables, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:gurulugomi_clone/widget/clip.dart';
import 'package:gurulugomi_clone/widget/headerwidget.dart';

class SlideBar extends StatefulWidget {
  SlideBar({Key? key}) : super(key: key);

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(child: Container(
              child: Column(
                children: const <Widget>[
                  Text('GuruluGomi',
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

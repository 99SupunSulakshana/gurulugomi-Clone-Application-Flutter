// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
//import 'package:gurulugomi_clone/screens/home_page.dart';

class Books extends StatefulWidget {
  Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: Colors.deepOrange,
        ),
      ),
    );
  }
}

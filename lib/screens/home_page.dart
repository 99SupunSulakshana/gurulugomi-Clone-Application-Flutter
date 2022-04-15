// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_label, sized_box_for_whitespace, unused_field, use_key_in_widget_constructors, prefer_final_fields, curly_braces_in_flow_control_structures, avoid_unnecessary_containers, unnecessary_import
//import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gurulugomi_clone/screens/all_book.dart';
import 'package:gurulugomi_clone/screens/category.dart';
import 'package:gurulugomi_clone/screens/search.dart';
import 'package:gurulugomi_clone/screens/slidebar.dart';
//import 'package:gurulugomi_clone/screens/slidebar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _controller = ScrollController();
  var _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels > 0) if (_isVisible)
          setState(() {
            _isVisible = false;
          });
      } else {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gurulugomi',
              style: TextStyle(fontWeight: FontWeight.normal)),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          // elevation: 0.05,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Check()));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Category()));
                },
                icon: Icon(Icons.list_sharp))
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) => Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10.0, right: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(" New Book $index"),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Books()));
                          },
                          icon: Icon(Icons.navigate_next),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 150,
                        width: 100,
                        margin: EdgeInsets.all(10.0),
                        color: Colors.red,
                        child: ListTile(
                          title: Text("BOOK$index"),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Check()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        bottomNavigationBar: Visibility(
          visible: _isVisible,
          child: Container(
            height: 80.0,
            color: Colors.white,
            child: Container(
              height: 80.0,
              padding: EdgeInsets.all(5.0).copyWith(right: 5.0),
              color: Colors.white,
              child: Row(children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Login in to enjoy all features",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                          )),
                      IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {},
                          iconSize: 12.0,
                          alignment: Alignment.topRight),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

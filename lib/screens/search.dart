// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, dead_code, use_key_in_widget_constructors, must_be_immutable, unused_field, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController? _textEditingController = TextEditingController();
  List<String> foodListOnSearch = [];
  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',
    'Chickpeas',
    'Pinto beans',
    'White Beans',
    'Green lentils',
    'Split Peas',
    'Rice',
    'Oats',
    'Quinoa',
    'Pasta',
    'Sparkling water',
    'Coconut water',
    'Herbal tea',
    'Kombucha',
    'Almonds',
    'Peannuts',
    'Chia seeds',
    'Flax seeds',
    'Canned tomatoes',
    'Olive oil',
    'Broccoli',
    'Onions',
    'Garlic',
    'Carots',
    'Leafy greens',
    'Meat',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            child: TextField(
              style: TextStyle(
                fontSize: 15.0,
                height: 1.5,
              ),
              onChanged: ((value) {
                setState(() {
                  foodListOnSearch = foodList
                      .where((element) =>
                          element.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              }),
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Author,Title,Category,ISBN',
                  icon: Icon(
                    Icons.close,
                  )),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                foodListOnSearch.clear();
                _textEditingController!.clear();
                setState(() {
                  _textEditingController!.text = '';
                });
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
      body: _textEditingController!.text.isNotEmpty && foodListOnSearch.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 100,
                  ),
                  Text('No Result Found!')
                ],
              ),
            )
          : ListView.builder(
              itemCount: _textEditingController!.text.isNotEmpty
                  ? foodListOnSearch.length
                  : foodList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.food_bank),
                      ),
                      SizedBox(width: 10),
                      Text(
                        _textEditingController!.text.isNotEmpty
                            ? foodListOnSearch[index]
                            : foodList[index],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}

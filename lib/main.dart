// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, unused_local_variable

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gurulugomi_clone/screens/home_page.dart';
//import 'package:hexcolor/hexcolor.dart';
//import 'screens/home_page.dart';
//import 'screens/slidebar.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.yellow.shade700,
      ),
      home: HomeScreen(),
    );
  }
}

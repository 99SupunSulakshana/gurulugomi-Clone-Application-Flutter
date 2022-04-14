// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

// class Check extends StatefulWidget {
//   Check({Key? key}) : super(key: key);

//   @override
//   State<Check> createState() => _CheckState();
// }

// class _CheckState extends State<Check> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: WaveWidget(
//         config: CustomConfig(
//           gradients: [
//             [Colors.red, Colors.pinkAccent],
//             [Colors.redAccent, Colors.pinkAccent],
//             [Colors.orange, Colors.yellowAccent],
//             [Colors.yellowAccent, Colors.red],
//           ],
//           gradientBegin: Alignment.centerLeft,
//           gradientEnd: Alignment.centerRight,
//           durations: [3500, 19440, 10800, 6000],
//           heightPercentages: [0.20, 0.23, 0.25, 0.30],
//           // blur: MaskFilter.blur(BlurStyle.solid, 2)
//         ),
//         size: Size(double.infinity, double.infinity),
//       ),
//     );
//   }
// }


// class Check extends StatefulWidget {
//   Check({Key? key}) : super(key: key);

//   @override
//   State<Check> createState() => _CheckState();
// }

// class _CheckState extends State<Check> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Container(
//             child: Stack(
//           children: <Widget>[
//             //stack overlaps widgets
//             Opacity(
//               //semi red clippath with more height and with 0.5 opacity
//               opacity: 0.5,
//               child: ClipPath(
//                 clipper: WaveClipper(), //set our custom wave clipper
//                 child: Container(
//                   color: Colors.deepOrangeAccent,
//                   height: 250,
//                 ),
//               ),
//             ),

//             ClipPath(
//               //upper clippath with less height
//               clipper: WaveClipper(), //set our custom wave clipper.
//               child: Container(
//                   padding: EdgeInsets.only(bottom: 50),
//                   color: Colors.deepOrange,
//                   height: 180,
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Wave clipper",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   )),
//             ),
//           ],
//         )));
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = new Path();
//     path.lineTo(
//         0, size.height); //start path with this if you are making at bottom

//     var firstStart = Offset(size.width / 5, size.height);
//     //fist point of quadratic bezier curve
//     var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
//     //second point of quadratic bezier curve
//     path.quadraticBezierTo(
//         firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

//     var secondStart =
//         Offset(size.width - (size.width / 3.24), size.height - 105);
//     //third point of quadratic bezier curve
//     var secondEnd = Offset(size.width, size.height - 10);
//     //fourth point of quadratic bezier curve
//     path.quadraticBezierTo(
//         secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

//     path.lineTo(
//         size.width, 0); //end with this path if you are making wave at bottom
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false; //if new instance have different instance than old instance
//     //then you must return true;
//   }
// }
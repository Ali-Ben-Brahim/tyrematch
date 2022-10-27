// import 'package:flutter/material.dart';
// import 'package:flutter_blue_app/pages/slide_page.dart';

// class Staticpage extends StatefulWidget {
//   Staticpage({Key key}) : super(key: key);

//   @override
//   State<Staticpage> createState() => _StaticpageState();
// }

// class _StaticpageState extends State<Staticpage> {
//   String test = "14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#";
//   List type = [
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#',
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#-70',
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#',
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#',
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#',
//     '14:39:57.381 \$B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => Slidepage(
//                             title: test,
//                           )),
//                 );
//               },
//               child: Text('Click!'))),
//     );
//   }
// }

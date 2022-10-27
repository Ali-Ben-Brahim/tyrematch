// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../provider/download_file_provider.dart';

// class AlertPage extends StatefulWidget {

//   AlertPage({Key key}) : super(key: key);

//   @override
//   State<AlertPage> createState() => _AlertPageState();
// }

// class _AlertPageState extends State<AlertPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Visibility(
//           visible: true,
//           child: Container(
//             height: 400,
//             width: 400,
//             child: Card(
//               elevation: 20,
//               clipBehavior: Clip.antiAlias,
//               child: Center(
//                   child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(""),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {});
//                           },
//                           icon: Icon(Icons.close),
//                           color: Colors.red,
//                           iconSize: 30),
//                     ],
//                   ),
//                   Flexible(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Damage description",
//                           style: TextStyle(fontSize: 22),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 width: 100,
//                                 child: Text(
//                                   'Area',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 5, vertical: 10.0),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(width: 1),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: const BorderSide(width: 1),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                 ),
//                                 items: [
//                                   '---',
//                                   'Bead',
//                                   'Shoulder',
//                                   'Sidewall',
//                                   'Tread'
//                                 ]
//                                     .map((e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e),
//                                         ))
//                                     .toList(),
//                                 value: Provider.of<downloadFileProvider>(
//                                         context,
//                                         listen: false)
//                                     .typeDamage1,
//                                 onChanged: (val) async {
//                                   setState(() {
//                                     Provider.of<downloadFileProvider>(context,
//                                             listen: false)
//                                         .typeDamage1 = val;
//                                     Provider.of<downloadFileProvider>(context,
//                                             listen: false)
//                                         .p10 = ['---'];
//                                     Provider.of<downloadFileProvider>(context,
//                                             listen: false)
//                                         .typeDamage10 = '---';

//                                     card1 = false;
//                                     isChecked = false;
//                                     typeDamage1 = '---';
//                                     typeDamage10 = '---';
//                                   });
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 width: 100,
//                                 child: Text(
//                                   'Damage',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 5, vertical: 10.0),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(width: 1),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: const BorderSide(width: 1),
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                 ),
//                                 items: Provider.of<downloadFileProvider>(
//                                         context,
//                                         listen: false)
//                                     .p10
//                                     .map((e) => DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e),
//                                         ))
//                                     .toList(),
//                                 value: Provider.of<downloadFileProvider>(
//                                         context,
//                                         listen: false)
//                                     .typeDamage10,
//                                 onChanged: (val) {
//                                   setState(() {
//                                     Provider.of<downloadFileProvider>(context,
//                                             listen: false)
//                                         .typeDamage10 = val;

//                                     // loadData2(typeDamage1, p1);
//                                   });

//                                   // print("ggggggggggggggg1ggggggg" +
//                                   //     Provider.of<downloadFileProvider>(context, listen: false)
//                                   //         .dam1
//                                   //         .toString());
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           //crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 width: 100,
//                                 child: Text(
//                                   'Comments',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: TextFormField(
//                                   controller: _commentsDamage1Controller,
//                                   keyboardType: TextInputType.multiline,
//                                   maxLines: 2,
//                                   decoration: const InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: 1, color: Colors.black)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: 1, color: Colors.black)))),
//                             )
//                           ],
//                         ),
//                         Container(
//                           width: 100,
//                           height: 40,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(
//                                   const Color(0xFF4A8522)),
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 Provider.of<downloadFileProvider>(context,
//                                         listen: false)
//                                     .card1 = false;
//                               });
//                             },
//                             child: const Text(
//                               "Save",
//                               style: TextStyle(fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//           )),
//     );
//   }
// }

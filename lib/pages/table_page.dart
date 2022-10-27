import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const_variable.dart';

class Detailschart extends StatefulWidget {
  const Detailschart({Key key, this.data}) : super(key: key);
  final String data;
  @override
  State<Detailschart> createState() => DetailschartState();
}

class DetailschartState extends State<Detailschart> {
  List type = [
    'Date&Time',
    'Tyrematch kit identification',
    'Menu element',
    'S1A',
    'S1B',
    'S2A',
    'S2B',
    'Distance measurement type',
    'DA',
    'DB',
    'Type of envinromental reading',
    'Temperature',
    'Atm Pressure',
    'Air moisture',
    "N°",
    'Test #'
  ];

  DataRow fct(i, j) {
    return DataRow(cells: [
      DataCell(
        Text('$i', style: GoogleFonts.lora(textStyle: styledata)),
      ),
      DataCell(
        Text('$j', style: GoogleFonts.lora(textStyle: styledata)),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var test = widget.data.split(RegExp(r"\s+|,\s+"));

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Table",
                  style: GoogleFonts.ibarraRealNova(textStyle: styletitle),
                ),
                DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Type',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                      DataColumn(
                        label: Text('Donnees', style: TextStyle(fontSize: 28)),
                      ),
                    ],
                    rows: List.generate(
                        type.length, (index) => fct(type[index], test[index]))),
                SizedBox(
                  height: 20,
                ),
              ]),
        ],
      ),
    ));
  }
}

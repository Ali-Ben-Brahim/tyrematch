import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_app/provider/download_file_provider.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../pages/input/modif_vehicle.dart';

class HeaderCard extends StatefulWidget {
  String title;
  var calculation;
  var details;
  var date;
  var rsize;
  var fsize;
  var data;
  HeaderCard(
      {Key key,
      this.title,
      this.details,
      this.date,
      this.fsize,
      this.rsize,
      this.data})
      : super(key: key);

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
              child: Provider.of<downloadFileProvider>(context, listen: false)
                          .status ==
                      "false"
                  ? Image.asset("assets/images/basic.png")
                  : Image.asset("assets/images/advanced.png"),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Home(
                                        
                                      )));
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            color: const Color.fromARGB(255, 127, 127, 127),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                ListTile(
                  leading: Image.file(
                    File(Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .vehicleimagepath
                            .toString() +
                        "/vehicle_${widget.details}.jpg"),
                    width: 100,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  title: Text(
                    "${widget.details}",
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    "${widget.fsize} \n${widget.rsize}\n${widget.date}",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ModifVehicle(
                                data: widget.data, Details: widget.details)));
                      },
                      child: Text(
                        "Modify vehicle data",
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: const Color(0xFF4A8522)),
                      )),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_app/pages/input/modif_vehicle.dart';
import 'package:flutter_blue_app/pages/read/read_veh_detail.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/download_file_provider.dart';
import 'home.dart';

class Pervehicle extends StatefulWidget {
  var calculation;
  var details;
  var date;
  var rsize;
  var fsize;
  var data;
  Pervehicle(
      {Key key, this.details, this.date, this.fsize, this.rsize, this.data})
      : super(key: key);

  @override
  State<Pervehicle> createState() => _PervehicleState();
}

class _PervehicleState extends State<Pervehicle> {
  final TextEditingController _lnameController = TextEditingController();
  var keys = [];
  List _vehicles = [];
  List _date = [];
  var _foundUsers;
  var p100;
  var p = true;
  @override
  void initState() {
    _vehicles = [];
    _date = [];
    _foundUsers = [];
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<downloadFileProvider>(context, listen: false)
            .fctListVehicles2(widget.details));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _vehicles =
        Provider.of<downloadFileProvider>(context, listen: false)
            .listperVehicles);
    WidgetsBinding.instance.addPostFrameCallback((_) => _date =
        Provider.of<downloadFileProvider>(context, listen: false)
            .datelistperVehicles);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _foundUsers = _vehicles);
    print("oooooooooooo" + _vehicles.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("ttttttttttttttttt1" + _foundUsers.toString());
    double h = MediaQuery.of(context).size.height;

    setState(() {
      Provider.of<downloadFileProvider>(context, listen: true).listperVehicles;
      _foundUsers = _vehicles;

      // p100 = Provider.of<downloadFileProvider>(context, listen: true)
      //     .vehicleimagepath;
    });
    // var keys = [];
    //   if (_foundUsers != null) {
    //     keys = _foundUsers.keys.toList();
    //   }
    print("uuuuuuuuuuuuuuuuuuuuu" + _foundUsers.toString());
    return Center(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Container(
                      height: h * 0.96,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15),
                                    child: Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .status ==
                                            "false"
                                        ? Image.asset("assets/images/basic.png")
                                        : Image.asset(
                                            "assets/images/advanced.png"),
                                  ),
                                  onTap:(){Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Home(
                                       
                                      )));} ,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  color:
                                      const Color.fromARGB(255, 127, 127, 127),
                                  child: Center(
                                    child: Text(
                                      "Vehicle data",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
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
                                          File(Provider.of<
                                                          downloadFileProvider>(
                                                      context,
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
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ModifVehicle(
                                                              data: widget.data,
                                                              Details: widget
                                                                  .details)));
                                            },
                                            child: Text(
                                              "Modify vehicle data",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      const Color(0xFF4A8522)),
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
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                _foundUsers.isEmpty
                                    ? Center(
                                        child: Text(
                                          "Empty",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      )
                                    : SingleChildScrollView(
                                        child: Container(
                                          height: h / 2.2,
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: _foundUsers.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {},
                                                child: Card(
                                                  color: Color.fromARGB(
                                                      226, 255, 255, 255),
                                                  child: ListTile(
                                                    title: _foundUsers[index]
                                                            .toString()
                                                            .contains("IAR")
                                                        ? Text(
                                                            "Tyre match analysis",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          )
                                                        : Text(
                                                            "Tyre inspection",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                    // subtitle: Text(
                                                    //   "${_foundUsers[index]['TyreSize_F']} \n${_foundUsers[index]['TyreSize_R']}\n${_foundUsers[index]['date_creation']}",
                                                    //   style: TextStyle(fontSize: 18),
                                                    // ),
                                                    subtitle: Text(
                                                      " ${DateFormat("dd/MM/yyyy").format(_date[index])}",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    trailing: ElevatedButton(
                                                        style: ButtonStyle(
                                                          elevation:
                                                              MaterialStateProperty
                                                                  .all(0.0),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Color
                                                                      .fromARGB(
                                                                          0,
                                                                          74,
                                                                          133,
                                                                          34)),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      ReadFiles100(
                                                                        data: jsonDecode(
                                                                            jsonDecode(_foundUsers[index])),
                                                                        // vehicle: _foundUsers[index],
                                                                      )));

                                                          print(jsonDecode(
                                                                  jsonDecode(
                                                                      _foundUsers[
                                                                          index]))
                                                              .toString());
                                                        },
                                                        child: Text(
                                                          "See",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: const Color(
                                                                  0xFF4A8522)),
                                                        )),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/Bridgestone-Logo.png",
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // return Center(
              //   child: ElevatedButton (
              //     onPressed: (){
              //       Provider.of<downloadFileProvider>(context,listen: false).fctListVehicles();
              //     },
              //     child: Text("hi")
              //   )
            )));
  }
}

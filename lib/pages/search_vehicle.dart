import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_app/pages/pervehicle.dart';
import 'package:provider/provider.dart';
import '../provider/download_file_provider.dart';
import 'MyCostumForm.dart';
import 'home.dart';
import 'input/input_vehicle.dart';
import 'pervehicle1.dart';
import 'test.dart';

class SearchVehicle extends StatefulWidget {
  SearchVehicle({Key key, this.color}) : super(key: key);
  var color;
  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
  final TextEditingController _lnameController = TextEditingController();

  List _vehicles = [];
  List _foundUsers = [];
  var p100;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<downloadFileProvider>(context, listen: false)
            .fctListVehicles());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _vehicles =
        Provider.of<downloadFileProvider>(context, listen: false).listVehicles);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _foundUsers = _vehicles);
    print("oooooooooooo" + _vehicles.toString());
  }

  void _runFilter(String _lnameController3) {
    print(_lnameController3.toString());
    List results = [];
    if (_lnameController3.toString() == "") {
      results = _vehicles;
    } else {
      for (var i = 0; i < _vehicles.length; i++) {
        if (_vehicles[i].toString().contains(_lnameController3.toString())) {
          results.add(_vehicles[i]);
        }
      }
      // results = _foundUsers
      //     .where((user) => user
      //         .toString()
      //         .toLowerCase()
      //         .contains(_lnameController3.toString().toLowerCase()))
      //     .toList();

      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          results.toString());
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
      print("objectobjectobjectobjectobjectobjectobjectobjectobjectobject");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ttttttttttttttttt" + _foundUsers.toString());
    setState(() {
      p100 = Provider.of<downloadFileProvider>(context, listen: true)
          .vehicleimagepath;
    });

    print("uuuuuuuuuuuuuuuuuuuuu" + _foundUsers.toString());
    return Scaffold(
        body: SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Column(
            children: [
              InkWell(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
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
                    "My vehicles",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.67,
                child: TextFormField(
                  controller: _lnameController,
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black38,
                          width: 10,
                        )),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 85,
                height: 55,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF4A8522)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => InputVehicle()));
                    },
                    child: Text(
                      "New vehicle",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _foundUsers.isEmpty
                      ? Center(
                          child: Text(
                          "Empty",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ))
                      : SingleChildScrollView(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print("${_foundUsers[index]}");
                                  Provider.of<downloadFileProvider>(context,
                                          listen: false)
                                      .setInputVehicule(_foundUsers[index]);

                                  var etat = Provider.of<downloadFileProvider>(
                                          context,
                                          listen: false)
                                      .typehome;
                                  print("7777777777" + etat.toString());

                                  if (etat == "wifi") {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => MyWidget(
                                                // BL: "yes",
                                                // vehicle: _foundUsers[index],
                                                )));
                                  }
                                  if (etat == "tractor") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => TyreInspection(
                                                details: _foundUsers[index]
                                                    ['Regestation_plate'],
                                                date: _foundUsers[index]
                                                    ['date_creation'],
                                                fsize: _foundUsers[index]
                                                    ['TyreSize_F'],
                                                rsize: _foundUsers[index]
                                                    ['TyreSize_R'],
                                                data: _foundUsers[index])));
                                  }
                                  if (etat == "search") {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => Test(
                                                // BL: "yes",
                                                // vehicle: _foundUsers[index],
                                                )));
                                  }
                                },
                                child: Card(
                                  color: Color.fromARGB(226, 255, 255, 255),
                                  child: ListTile(
                                    leading: Image.file(
                                      File(Provider.of<downloadFileProvider>(
                                                  context,
                                                  listen: false)
                                              .vehicleimagepath
                                              .toString() +
                                          "/vehicle_${_foundUsers[index]['Regestation_plate']}.jpg"),
                                      width: 100,
                                      fit: BoxFit.cover,
                                      height: 100,
                                    ),
                                    title: Text(
                                      "${_foundUsers[index]['Regestation_plate']}",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    subtitle: Text(
                                      "${_foundUsers[index]['TyreSize_F']} \n${_foundUsers[index]['TyreSize_R']}\n${_foundUsers[index]['date_creation']}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Bridgestone-Logo.png",
            width: 200,
          ),
        )
      ]),
    ));
  }
}

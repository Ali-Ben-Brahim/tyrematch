import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/download_file_provider.dart';
import '../pages/read/read_veh_detail.dart';

class Body extends StatefulWidget {
  var details;
  Body({Key key, this.details}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    double h = MediaQuery.of(context).size.height;

    setState(() {
      Provider.of<downloadFileProvider>(context, listen: true).listperVehicles;
      _foundUsers = _vehicles;

      // p100 = Provider.of<downloadFileProvider>(context, listen: true)
      //     .vehicleimagepath;
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                                color: Color.fromARGB(226, 255, 255, 255),
                                child: ListTile(
                                  title: _foundUsers[index]
                                          .toString()
                                          .contains("IAR")
                                      ? Text(
                                          "Tyre match analysis",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      : Text(
                                          "Tyre inspection",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                  // subtitle: Text(
                                  //   "${_foundUsers[index]['TyreSize_F']} \n${_foundUsers[index]['TyreSize_R']}\n${_foundUsers[index]['date_creation']}",
                                  //   style: TextStyle(fontSize: 18),
                                  // ),
                                  subtitle: Text(
                                    " ${DateFormat("dd/MM/yyyy").format(_date[index])}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  trailing: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(0.0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(0, 74, 133, 34)),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => ReadFiles100(
                                                      data: jsonDecode(
                                                          jsonDecode(
                                                              _foundUsers[
                                                                  index])),
                                                      // vehicle: _foundUsers[index],
                                                    )));

                                        print(jsonDecode(
                                                jsonDecode(_foundUsers[index]))
                                            .toString());
                                      },
                                      child: Text(
                                        "See",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: const Color(0xFF4A8522)),
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
      ],
    );
  }
}

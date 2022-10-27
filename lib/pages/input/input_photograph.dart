// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/test.dart';
import 'package:flutter_blue_app/provider/download_file_provider.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:open_file/open_file.dart';

import 'package:path/path.dart';
import 'package:intl/intl.dart';

import '../home.dart';

class InputPhotographs extends StatefulWidget {
  var BL;
  var tyreId;
  var inspectionId;
  var st;
  var check;
  InputPhotographs(
      {Key key, this.BL, this.tyreId, this.inspectionId, this.st, this.check})
      : super(key: key);

  @override
  State<InputPhotographs> createState() => _InputPhotographsState();
}

class _InputPhotographsState extends State<InputPhotographs> {
  List verify1;
  PickedFile _imageFile;
  String imgn;
  DateTime now = DateTime.now();

  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  double ratingTraction = 0;
  double ratingRoadComfort = 0;
  double ratingVibration = 0;
  double ratingSoilCare = 0;
  final TextEditingController _commentsController = TextEditingController();
  Map _inputPerformance = {};
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hk =
        Provider.of<downloadFileProvider>(context, listen: false).performance;
    if (hk != null) {
      _commentsController.text = hk[4].toString();
    }

    double h6 = MediaQuery.of(context).size.height * 0.06;
    double h = MediaQuery.of(context).size.height;
    var _provider = Provider.of<downloadFileProvider>(context);
    return Center(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Scaffold(
                body: SafeArea(
              child: SingleChildScrollView(
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
                                child: widget.check == "ohh"
                                    ? Center(
                                        child: Text(
                                          "Verify the results",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          "Tyre Performance",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                color: Color.fromARGB(255, 127, 127, 127),
                              ),
                            ],
                          ),
                        ),
                        widget.st != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      flex: 1,
                                      child: Text(
                                        'Traction',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: RatingBar.builder(
                                              initialRating:
                                                  hk != null ? hk[0] : 0,
                                              updateOnDrag: true,
                                              minRating: 1,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xFF4A8522),
                                                  ),
                                              onRatingUpdate: (rating) {
                                                ratingTraction = rating;
                                              }),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.st != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      flex: 1,
                                      child: Text(
                                        'Road comfort',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: RatingBar.builder(
                                              initialRating:
                                                  hk != null ? hk[1] : 0,
                                              updateOnDrag: true,
                                              minRating: 1,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xFF4A8522),
                                                  ),
                                              onRatingUpdate: (rating) {
                                                setState(() {
                                                  ratingRoadComfort = rating;
                                                });
                                              }),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.st != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      flex: 1,
                                      child: Text(
                                        'Vibration',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: RatingBar.builder(
                                              initialRating:
                                                  hk != null ? hk[2] : 0,
                                              updateOnDrag: true,
                                              minRating: 1,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                    Icons.star,
                                                    color:
                                                        const Color(0xFF4A8522),
                                                  ),
                                              onRatingUpdate: (rating) {
                                                setState(() {
                                                  ratingVibration = rating;
                                                });
                                              }),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.st != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      flex: 1,
                                      child: Text(
                                        'Soil care',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 2,
                                        child: Container(
                                          child: RatingBar.builder(
                                              initialRating:
                                                  hk != null ? hk[3] : 0,
                                              updateOnDrag: true,
                                              minRating: 1,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xFF4A8522),
                                                  ),
                                              onRatingUpdate: (rating) {
                                                ratingSoilCare = rating;
                                              }),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  widget.st != null
                                      ? Row(
                                          children: [
                                            Text(
                                              "Add inspection picture",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: imageProfile(context))
                                          ],
                                        )
                                      : Container(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  widget.st != null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Text(
                                                'Comments',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Flexible(
                                                flex: 2,
                                                child: Container(
                                                    child: TextFormField(
                                                        controller:
                                                            _commentsController,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: 2,
                                                        decoration: const InputDecoration(
                                                            enabledBorder: const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .black)),
                                                            focusedBorder: const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .black))))))
                                          ],
                                        )
                                      : Container(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFF4A8522)),
                                      ),
                                      onPressed: () async {
                                        try {
                                          var PhotographsData = {
                                            "inspection_id": "",
                                            "photo": "$imgn.jpg",
                                          };
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();

                                          Provider.of<downloadFileProvider>(
                                                  context,
                                                  listen: false)
                                              .downloadFile(
                                                  Provider.of<downloadFileProvider>(
                                                          context,
                                                          listen: false)
                                                      .inputVehicule,
                                                  "Vehicles");
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            verify1 = [
                                                              ratingTraction,
                                                              ratingRoadComfort,
                                                              ratingVibration,
                                                              ratingSoilCare,
                                                              _commentsController
                                                                  .text
                                                            ];
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .setperformance(
                                                                    verify1);

//                                                 var verify1 = {
// "rating1":"",
// "rating2":"",
// "rating3":"",
// "rating4":"",

// "comments":"",

//                                                 };
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            Navigator.of(
                                                                    context)
                                                                .pop(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (_) =>
                                                                          Test(
                                                                            j: true,
                                                                          )),
                                                            );
                                                            // showDialog<void>(
                                                            //   context: context,
                                                            //   barrierDismissible:
                                                            //       true, // user must tap button!
                                                            //   builder:
                                                            //       (BuildContext context) {
                                                            //     return AlertDialog(
                                                            //       title: Center(
                                                            //         child: Text(
                                                            //             '${_provider.sessionName}'),
                                                            //       ),
                                                            //       content:
                                                            //           SingleChildScrollView(
                                                            //         child: _provider
                                                            //                 .listModifyFolder
                                                            //                 .isEmpty
                                                            //             ? Center(
                                                            //                 child:
                                                            //                     CircularProgressIndicator())
                                                            //             : Container(
                                                            //                 height: 300,
                                                            //                 child: ListView
                                                            //                     .builder(
                                                            //                         shrinkWrap:
                                                            //                             true,
                                                            //                         itemCount: _provider
                                                            //                             .listModifyFolder
                                                            //                             .length,
                                                            //                         itemBuilder:
                                                            //                             (context,
                                                            //                                 index) {
                                                            //                           var fileName = _provider
                                                            //                               .listModifyFolder[index]
                                                            //                               .toString();

                                                            //                           return ListTile(
                                                            //                               onTap: () async {
                                                            //                                 var nameFilePath = await _provider.listModifyFolder[index];
                                                            //                                 bool existedTyre = fileName.toLowerCase().contains("tyres");
                                                            //                                 bool existedPhotographs = fileName.toLowerCase().contains("photographs");
                                                            //                                 bool existedInspections = fileName.toLowerCase().contains("inspections");
                                                            //                                 bool existedTyrematchInspections = fileName.toLowerCase().contains("tyrematchInspections");
                                                            //                                 bool existedVehicles = fileName.toLowerCase().contains("vehicles");
                                                            //                                 bool existedCalculation = fileName.toLowerCase().contains("calculations");
                                                            //                                 if (existedTyre) {
                                                            //                                   Navigator.of(context).push(MaterialPageRoute(
                                                            //                                       builder: (_) => ModifyFileTyre(
                                                            //                                             file: Provider.of<downloadFileProvider>(context, listen: false).inputTyre,
                                                            //                                           )));
                                                            //                                 }

                                                            //                                 if (existedInspections) {
                                                            //                                   Navigator.of(context).push(MaterialPageRoute(
                                                            //                                       builder: (_) => ModifyFileInspection(
                                                            //                                             file: Provider.of<downloadFileProvider>(context, listen: false).inputInspection,
                                                            //                                           )));
                                                            //                                 }
                                                            //                                 if (existedTyrematchInspections) {
                                                            //                                   Navigator.of(context).push(MaterialPageRoute(
                                                            //                                       builder: (_) => ModifyFileTyreInspection(
                                                            //                                             file: Provider.of<downloadFileProvider>(context, listen: false).inputTyreInspection,
                                                            //                                           )));
                                                            //                                 }
                                                            //                                 if (existedVehicles) {
                                                            //                                   Navigator.of(context).push(MaterialPageRoute(
                                                            //                                       builder: (_) => ModifyFileVehicle(
                                                            //                                             file: Provider.of<downloadFileProvider>(context, listen: false).inputVehicule,
                                                            //                                           )));
                                                            //                                 }
                                                            //                               },
                                                            //                               title: Card(child: Text("$fileName")));
                                                            //                         }),
                                                            //               ),
                                                            //       ),
                                                            //       actions: <Widget>[
                                                            //         TextButton(
                                                            //           child: const Text(
                                                            //               'Return'),
                                                            //           onPressed: () {
                                                            //             Navigator.of(
                                                            //                     context)
                                                            //                 .pop();
                                                            //           },
                                                            //         ),
                                                            //       ],
                                                            //     );
                                                            //   },
                                                            // );
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(
                                                                        0xFF4A8522)),
                                                          ),
                                                          child: Container(
                                                              child: Row(
                                                            children: [
                                                              Icon(Icons.edit),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Text(
                                                                "Verify",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ))),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            SharedPreferences
                                                                prefs4 =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            var a = prefs4
                                                                .getString(
                                                                    "fname");
                                                            var b = prefs4
                                                                .getString(
                                                                    "lname");
                                                            var c = prefs4
                                                                .getString(
                                                                    "email");
                                                            var d = prefs4
                                                                .getString(
                                                                    "region");

                                                            var inputUser = {
                                                              "First name":
                                                                  a.toString(),
                                                              "Last name":
                                                                  b.toString(),
                                                              "Email":
                                                                  c.toString(),
                                                              "Region":
                                                                  d.toString()
                                                            };
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .setInputuser(
                                                                    inputUser);

                                                            var st = {
                                                              "stat": 0
                                                            };
                                                            _inputPerformance =
                                                                {
                                                              "Traction":
                                                                  ratingTraction
                                                                      .toString(),
                                                              "Road comfort":
                                                                  ratingRoadComfort
                                                                      .toString(),
                                                              "Vibration":
                                                                  ratingVibration
                                                                      .toString(),
                                                              "Soil care":
                                                                  ratingSoilCare
                                                                      .toString(),
                                                              "Comments":
                                                                  _commentsController
                                                                      .text,
                                                            };
                                                            print("star" +
                                                                _inputPerformance
                                                                    .toString());
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .setPerformance(
                                                                    _inputPerformance);

                                                            print("rami" +
                                                                Provider.of<downloadFileProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .Tyrematch
                                                                    .toString());
                                                            var jsonFile = {
                                                              "User": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputuser,

                                                              //jsonEncode(input_user),
                                                              "Tyre_match_Inspection":
                                                                  Provider.of<downloadFileProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .Tyrematch,
                                                              "Calculations": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .calculation,
                                                              "Details": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .details,
                                                              "Vehicles": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputVehicule,
                                                              "Tyre_inspections": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputTyreInspection,
                                                              // "Tyres": jsonEncode(
                                                              //     Provider.of<downloadFileProvider>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .inputTyre),
                                                              "Performance": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputPerformance,
                                                              "Photographs":
                                                                  PhotographsData,
                                                            };
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .downloadFile(
                                                                    jsonFile,
                                                                    "Final report");
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .downloadFile(
                                                                    st,
                                                                    "notsend");
                                                            Navigator.of(
                                                                    context)
                                                                .pushAndRemoveUntil(
                                                                    MaterialPageRoute(
                                                                        builder: (_) =>
                                                                            Home(
                                                                              color: false,
                                                                            )),
                                                                    (_) =>
                                                                        false);
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(
                                                                        0xFF4A8522)),
                                                          ),
                                                          child: Container(
                                                              child: Row(
                                                            children: [
                                                              Icon(Icons.save),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Text(
                                                                "Save & Quit",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ))),
                                                      /* ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            Bluetoothpage()));
                                              },
                                              child: Text("add another inspection")),*/
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            var st = {
                                                              "stat": 0
                                                            };
                                                            _inputPerformance =
                                                                {
                                                              "Traction":
                                                                  ratingTraction
                                                                      .toString(),
                                                              "Road comfort":
                                                                  ratingRoadComfort
                                                                      .toString(),
                                                              "Vibration":
                                                                  ratingVibration
                                                                      .toString(),
                                                              "Soil care":
                                                                  ratingSoilCare
                                                                      .toString(),
                                                              "Comments":
                                                                  _commentsController
                                                                      .text,
                                                            };
                                                            print("star" +
                                                                _inputPerformance
                                                                    .toString());
                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .setPerformance(
                                                                    _inputPerformance);
                                                            SharedPreferences
                                                                prefs4 =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            var a = prefs4
                                                                .getString(
                                                                    "fname");
                                                            var b = prefs4
                                                                .getString(
                                                                    "lname");
                                                            var c = prefs4
                                                                .getString(
                                                                    "email");
                                                            var d = prefs4
                                                                .getString(
                                                                    "region");

                                                            var inputUser = {
                                                              "First name":
                                                                  a.toString(),
                                                              "Last name":
                                                                  b.toString(),
                                                              "Email":
                                                                  c.toString(),
                                                              "Region":
                                                                  d.toString()
                                                            };

                                                            Provider.of<downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .setInputuser(
                                                                    inputUser);
                                                            print(prefs4);
                                                            var jsonFile = {
                                                              "User": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputuser,
                                                              "Tyre_match_Inspection":
                                                                  Provider.of<downloadFileProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .Tyrematch,
                                                              "Calculations": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .calculation,
                                                              "Details": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .details,
                                                              "Vehicles": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputVehicule,
                                                              "Tyre_inspections": await Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputTyreInspection,
                                                              // "Tyres": jsonEncode(
                                                              //     Provider.of<downloadFileProvider>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .inputTyre),
                                                              "Performance": Provider.of<
                                                                          downloadFileProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .inputPerformance,
                                                              "Photographs":
                                                                  PhotographsData,
                                                            };
                                                            print(
                                                                "uuuuuuuuuuuuuuuuuuuuuuuuuu|| ${Provider.of<downloadFileProvider>(context, listen: false).inputTyre.toString()}");
                                                            await Provider.of<
                                                                        downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .downloadFile(
                                                                    jsonFile,
                                                                    "Final report");

                                                            var c4;

                                                            var p = Provider.of<
                                                                        downloadFileProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .p1
                                                                .path;
                                                            print(p.toString());

                                                            final dataDir =
                                                                Directory(p);

                                                            print(
                                                                "path ppppppppppp $p");
                                                            try {
                                                              final zipFile =
                                                                  File(p +
                                                                      "_file.zip");
                                                              c4 = ZipFile.createFromDirectory(
                                                                  sourceDir:
                                                                      dataDir,
                                                                  zipFile:
                                                                      zipFile,
                                                                  recurseSubDirs:
                                                                      true);
                                                              print(
                                                                  "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv ${await c4}");

                                                              final Email
                                                                  sendEmail =
                                                                  Email(
                                                                body:
                                                                    ' the inspection is compressed \n Inspection Id : widget.inspectionId',
                                                                subject:
                                                                    'Inspection tyre match',
                                                                recipients: [
                                                                  'AG projects - Bridgestone <147c67b5.xflowdata.com@emea.teams.ms>'
                                                                ],
                                                                attachmentPaths: [
                                                                  p + "_file.zip"
                                                                ],
                                                                isHTML: false,
                                                              );

                                                              await FlutterEmailSender
                                                                  .send(
                                                                      sendEmail);
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                            List<String>
                                                                _listModifyFolder =
                                                                [
                                                              "tyres",
                                                              "inspections",
                                                              "tyrematchInspections",
                                                              "vehicles",
                                                              "calculation"
                                                            ];
                                                            print(
                                                                "pppppppppppp: ${p.toString()}");
                                                            await File(p +
                                                                    "_file.zip")
                                                                .delete();
                                                            await prefs.clear();
                                                            _listModifyFolder =
                                                                [];

                                                            Navigator.of(
                                                                    context)
                                                                .pushAndRemoveUntil(
                                                                    MaterialPageRoute(
                                                                        builder: (_) =>
                                                                            Home(
                                                                              color: false,
                                                                            )),
                                                                    (_) =>
                                                                        false);
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(
                                                                        0xFF4A8522)),
                                                          ),
                                                          child: Container(
                                                              child: Row(
                                                            children: [
                                                              Icon(Icons.send),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Text(
                                                                "Save & Send",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ))),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } catch (e) {
                                          print(",,,,,,,,,,,," + e.toString());
                                        }
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ))));
  }

  Widget imageProfile(context) {
    return Center(
      child: InkWell(
        onTap: () {
          _isVisible = true;
          showModalBottomSheet(
            context: context,
            builder: ((builder) => bottomSheet(context)),
          );
        },
        child: Stack(children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: _imageFile == null
                ? AssetImage("assets/images/camera.png")
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                _isVisible = true;
                print("objectobjectobjectobjectobjectobject" +
                    _isVisible.toString());
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget bottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(child: Container()),
            ElevatedButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera, context);
              },
              label: Text("Camera"),
            ),
            Expanded(child: Container()),
            ElevatedButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery, context);
              },
              label: Text("Gallery"),
            ),
            Expanded(child: Container()),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source, context) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
    if (_imageFile == null) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cal99 =
        Provider.of<downloadFileProvider>(context, listen: false).name;
    imgn = cal99;
    String dir = dirname(_imageFile.path);
    if (cal99 == null) {
      cal99 = "photo";
    }
    String newPath = join(dir, cal99 + '.jpg');

    if (Provider.of<downloadFileProvider>(context, listen: false).typehome ==
        "search") {
      Directory directory;

      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          String newPath = "";
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }

          String formattedDate = DateFormat('yyyy-MM-dd–kk-mm').format(now);

          SharedPreferences prefs1 = await SharedPreferences.getInstance();

          String path = prefs1.getString('path');
          print("pathpathpathpathpath : $path");

          newPath = newPath + "/bridge/" + "$formattedDate" + "_TyreInspection";
          await Provider.of<downloadFileProvider>(context, listen: false)
              .setP1(newPath);

          print("directorydirectorydirectory : $directory");

          directory = Directory(newPath);
          print("jnlsjlsssssssssssssssssssssssssssssssssssssssssssss" +
              newPath.toString());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('path', newPath.toString());
        } else {
          //  return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          // return false;
        }
      }

      new Directory(
              Provider.of<downloadFileProvider>(context, listen: false).p1.path)
          .createSync();
      var newPath = await File(_imageFile.path).copy(
          '${Provider.of<downloadFileProvider>(context, listen: false).p1.path}/' +
              cal99 +
              '.jpg');
    } else {
      new Directory(
              Provider.of<downloadFileProvider>(context, listen: false).p1.path)
          .createSync();
      var newPath = await File(_imageFile.path).copy(
          '${Provider.of<downloadFileProvider>(context, listen: false).p1.path}/' +
              cal99 +
              '.jpg');
    }

    final result = await ImageGallerySaver.saveFile(
      newPath,
    );
  }
}

import 'package:flutter/material.dart';

import '../home.dart';
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_app/pages/search_vehicle.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/download_file_provider.dart';
import '../home.dart';

class InputUserBody extends StatefulWidget {
  var color;
  InputUserBody({Key key, this.color}) : super(key: key);

  @override
  State<InputUserBody> createState() => _InputUserBodyState();
}

class _InputUserBodyState extends State<InputUserBody> {
  var m1;
  var m2;
  var m3;
  var m4;
  String pa;
  var prefs40;
  var prefs41;
  var prefs42;
  var prefs43;
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var exist;
  var tr;
  @override
  void initState() {
    if (widget.color == "1") {
      tr = false;
    }
    super.initState();
    stst();
  }

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

  stst() async {
    print("hneeeeeeeee");
    Directory directory;
    try {
      String newPath = "";

      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        print('Running on ${androidInfo.manufacturer}');
        if (androidInfo.manufacturer.toString() == "HUAWEI") {
          if (await _requestPermission(Permission.storage) //&&
              // access media location needed for android 10/Q
              // await _requestPermission(Permission.accessMediaLocation) &&
              // // manage external storage needed for android 11/R
              // await _requestPermission(Permission.manageExternalStorage)

              ) {
            directory = (await getExternalStorageDirectory());
            List<String> paths = directory.path.split("/");
            for (int x = 1; x < paths.length; x++) {
              String folder = paths[x];
              if (folder != "Android") {
                newPath += "/" + folder;
              } else {
                break;
              }
            }
            newPath = newPath + "/bridge/user";
            print("eeeeeeeeeeeeeeeeee" + newPath);
            directory = Directory(newPath);
            pa = newPath;
          }
        }

        if (!androidInfo.manufacturer.toString().contains("HUAWEI")) {
          if (await _requestPermission(Permission.storage) &&
              // access media location needed for android 10/Q
              await _requestPermission(Permission.accessMediaLocation) &&
              // manage external storage needed for android 11/R
              await _requestPermission(Permission.manageExternalStorage)) {
            directory = (await getExternalStorageDirectory());
            List<String> paths = directory.path.split("/");
            for (int x = 1; x < paths.length; x++) {
              String folder = paths[x];
              if (folder != "Android") {
                newPath += "/" + folder;
              } else {
                break;
              }
            }
            newPath = newPath + "/bridge/user";
            directory = Directory(newPath);
            pa = newPath;
          }
        }
      }

      exist = true;

      String info = await File(newPath + "/user.json").readAsString();
      print("vvvvvvvvvvvvvvvvvvvv" + info.toString());
      var kl = jsonDecode(info);

      print(
          "daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + kl.toString());
      setState(() {
        prefs40 = kl["First name"].toString();
        prefs41 = kl["Last name"].toString();
        prefs42 = kl["Email"].toString();
        prefs43 = kl["country"].toString();
        //   dispose();
      });
      if (tr == false && prefs40 != null) {
        _emailController.text = prefs42;
        _fnameController.text = prefs40;
        _lnameController.text = prefs41;
        _regionController.text = prefs43;
      }
    } catch (e) {
      print(e);
    }
    return exist;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        tr == false
            ? Container()
            : prefs40 != null
                ? InkWell(
                    onTap: () async {
                      SharedPreferences prefs4 =
                          await SharedPreferences.getInstance();
                      prefs4.setString('fname', prefs40);
                      prefs4.setString('lname', prefs41);
                      prefs4.setString('email', prefs42);
                      prefs4.setString('region', prefs43);

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Home()));
                    },
                    child: Text(
                      'Continue as  ${prefs40.toString()} ${prefs41.toString()}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                : Container(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /*  :*/ Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 100,
                                child: Text("Name",
                                    style: TextStyle(fontSize: 20))),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _fnameController,
                                validator: (value) =>
                                    value.isEmpty ? 'Required' : null,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                width: 100,
                                child: Text("Surname",
                                    style: TextStyle(fontSize: 20))),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _lnameController,
                                validator: (value) =>
                                    value.isEmpty ? 'Required' : null,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Axle 1

                        Row(
                          children: [
                            Container(
                                width: 100,
                                child: Text("Email",
                                    style: TextStyle(fontSize: 20))),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) =>
                                    value.isEmpty ? 'Required' : null,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Axle 2
                        Row(
                          children: [
                            Container(
                                width: 100,
                                child: Text("Country",
                                    style: TextStyle(fontSize: 20))),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _regionController,
                                validator: (value) =>
                                    value.isEmpty ? 'Required' : null,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A8522)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          final _inputuser = {
                            "First name": _fnameController.text,
                            "Last name": _lnameController.text,
                            "Email": _emailController.text,
                            "country": _regionController.text
                          };
                          Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .setUser(_inputuser);

                          SharedPreferences prefs4 =
                              await SharedPreferences.getInstance();
                          prefs4.setString('fname', _fnameController.text);
                          prefs4.setString('lname', _lnameController.text);
                          prefs4.setString('email', _emailController.text);
                          prefs4.setString('country', _regionController.text);
                          // Provider.of<downloadFileProvider>(context,
                          //         listen: false)
                          //     .readFromFile2;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Home(
                                    color: widget.color,
                                  )));
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}

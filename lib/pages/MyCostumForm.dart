import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MainPage.dart';
import '../provider/download_file_provider.dart';
import 'home.dart';

class MyWidget extends StatefulWidget {
  var c2;
  var title;
  var c1;
  MyWidget({
    Key key,
    this.c1,
    this.c2,
    this.title,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  var _isVisible = false;
  String nameFolder;

  star() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    String path = prefs1.getString('path');

    if (path == null || path.isEmpty) {
      print("_isVisible = true");
      setState(() {
        _isVisible = true;
      });
    } else {
      nameFolder = prefs1.getString('nameFolder');
      print("_isVisible = false");
      setState(() {
        _isVisible = false;
        myController.text = nameFolder;
      });
    }
  }

  @override
  void initState() {
    star();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Home(
                                       
                                      )));
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    color: const Color.fromARGB(
                                        255, 127, 127, 127),
                                    child: Center(
                                      child: Text(
                                        "Session name",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: myController,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter some text';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText:
                                                    "Create a session name",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: w / 1.6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  "This session name will help you search for your analysis later.",
                                                  textAlign: TextAlign.center),
                                            )),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xFF4A8522)),
                                            ),
                                            onPressed: () async {
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .setName(myController.text);
                                              // SharedPreferences prefs =
                                              //     await SharedPreferences.getInstance();
                                              // nameFolder = prefs.getString('nameFolder');
                                              // if (nameFolder == null || nameFolder.isEmpty)
                                              //   prefs.setString('nameFolder', myController.text);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Bluetoothpage(
                                                            // title: widget.title,
                                                            // c1: widget.c1,
                                                            // c2: widget.c2,
                                                            n1: myController
                                                                .text)),
                                              );
                                            },
                                            child: const Text(
                                              "Next",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
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
                            )
                          ]),
                    ),
                  ))),
        ),
      ),
    );
  }
}

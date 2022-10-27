import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/download_file_provider.dart';
import '../home.dart';

class ReadFiles100 extends StatefulWidget {
  var data;
  ReadFiles100({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  State<ReadFiles100> createState() => _ReadFiles100State();
}

class _ReadFiles100State extends State<ReadFiles100> {
  var files;
  bool bi;
  var p;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getrole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      p = prefs.getBool("color");
    });
    print("colorcolor : $p");
  }

  @override
  Widget build(BuildContext context) {
    var calcule = widget.data;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var files = print("calculecalculecalcule : $calcule");
    var keys = [];

    calcule.removeWhere(
        (element, values) => calcule[element].toString().contains("null"));
    if (calcule != null) {
      keys = calcule.keys.toList();
    }
    print("yyy" + calcule.toString());

    return WillPopScope(
        onWillPop: () async {
          await Provider.of<downloadFileProvider>(context, listen: false)
              .setReadjson({});
          Navigator.of(context).pop();
          return true;
        },
        child: Scaffold(
            body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: Provider.of<downloadFileProvider>(context,
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
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: const Color.fromARGB(255, 127, 127, 127),
                    child: Center(
                      child: Text(
                        "Inspection report",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
                Container(
                  height: h * 0.60,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        keys.isEmpty
                            ? Center(
                                child: Container(child: Text(" Is Empty")),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: keys.length,
                                itemBuilder: (context, index) {
                                  List text = [];
                                  var values = calcule[keys[index]]
                                      .toString()
                                      .substring(
                                          1,
                                          calcule[keys[index]]
                                                  .toString()
                                                  .length -
                                              1);
                                  text = values.split(',');

                                  return Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 0.5),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                        child: ExpansionTile(
                                            maintainState: true,
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "${keys[index]} ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Buffalo',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      22.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: text.length,
                                                        itemBuilder:
                                                            (context, i) {
                                                          if (!text[i]
                                                              .toString()
                                                              .contains("§R")) {
                                                            if (!keys[index]
                                                                .toString()
                                                                .contains(
                                                                    "Photographs")) {
                                                              if (p == false &&
                                                                  keys[index] ==
                                                                      "Calculation" &&
                                                                  i > 1) {
                                                                return Text("");
                                                              } else {
                                                                print("objectobjectobjectobject" +
                                                                    text[i]
                                                                        .toString());

                                                                text[i] = text[
                                                                        i]
                                                                    .toString()
                                                                    .replaceFirst(
                                                                        " ", "")
                                                                    .trim();
                                                                var s;

                                                                s = text[i]
                                                                    .toString()
                                                                    .split(":");

                                                                return Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              140,
                                                                          child:
                                                                              Text(
                                                                            "${s[0].toString()}  ",
                                                                            style:
                                                                                TextStyle(fontSize: 16),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                            child: Container(
                                                                                child: Text(
                                                                          "${s[1]}  ",
                                                                          softWrap:
                                                                              true,
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        )))
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      height:
                                                                          10,
                                                                      thickness:
                                                                          1,
                                                                      color: Color
                                                                          .fromARGB(
                                                                              22,
                                                                              78,
                                                                              78,
                                                                              78),
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            }
                                                          }
                                                        },
                                                      )
                                                    ],
                                                  ))
                                            ]),
                                      ));
                                }),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/Bridgestone-Logo.png",
                        width: 200,
                      ),
                    ),
                  ],
                )
              ]),
        )));
  }
}

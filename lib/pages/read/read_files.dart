import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/download_file_provider.dart';
import '../home.dart';

class ReadFiles extends StatefulWidget {
  var path;
  var exist;

  ReadFiles({Key key, this.path, this.exist}) : super(key: key);

  @override
  State<ReadFiles> createState() => _ReadFilesState();
}

class _ReadFilesState extends State<ReadFiles> {
  var files;
  bool bi;
  var p;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<downloadFileProvider>(context, listen: false)
          .fctListFiles(widget.path);
      getrole();
    });

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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var files =
        Provider.of<downloadFileProvider>(context, listen: true).listFiles;
    Map calcule =
        Provider.of<downloadFileProvider>(context, listen: true).readjson;
    print("calculecalculecalcule : $calcule");
    var keys = [];

    // calcule.removeWhere(
    //     (element, values) => calcule[element].toString().contains("null"));
    if (calcule != null) {
      keys = calcule.keys.toList();
    }
    print("yyy" + calcule.toString());

    return Scaffold(
        body: SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
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
                              .substring(1,
                                  calcule[keys[index]].toString().length - 1);
                          text = values.split(',');

                          return Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Container(
                                margin: EdgeInsets.only(right: 0.5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                child: ExpansionTile(
                                    maintainState: true,
                                    title: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${keys[index]} ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Buffalo',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(22.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: text.length,
                                                itemBuilder: (context, i) {
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
                                                        print(
                                                            "objectobjectobjectobject" +
                                                                text[i]
                                                                    .toString());

                                                        text[i] = text[i]
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
                                                                  width: 140,
                                                                  child: Text(
                                                                    "${s[0].toString()}  ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    child: Container(
                                                                        child: Text(
                                                                  "${s[1]}  ",
                                                                  softWrap:
                                                                      true,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15),
                                                                )))
                                                              ],
                                                            ),
                                                            Divider(
                                                              height: 10,
                                                              thickness: 1,
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
            widget.exist == true
                ? ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF4A8522)),
                    ),
                    child: Text("Send"),
                    onPressed: () async {
                      try {
                        Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .fctListFolders();
                        final dataDir = widget.path;
                        //     File(dataDir.path + "/notsend.json").delete();

                        var c4;

                        //         final zipFile = File(dataDir.path + "_aaa_file.zip");
                        // c4 = ZipFile.createFromDirectory(
                        //     sourceDir: dataDir,
                        //     zipFile: zipFile,
                        //     recurseSubDirs: false);

                        final Email sendEmail = Email(
                          body: 'your inspection is compressed',
                          subject: 'Final report',
                          recipients: ['Rami.Louati@xflowdata.com'],
                          attachmentPaths: [
                            dataDir.path + "/Final report.json"
                          ],
                          isHTML: false,
                        );

                        await FlutterEmailSender.send(sendEmail);
                        //   await File(zipFile.path).delete();

                        //    Navigator.pop(context);
                      } catch (_) {}
                    },
                  )
                : Container(),
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
    ));
  }
}

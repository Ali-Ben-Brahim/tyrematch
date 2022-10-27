import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/read/read_files.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../provider/download_file_provider.dart';
import '../home.dart';

class ReadFolders extends StatefulWidget {
  const ReadFolders({Key key}) : super(key: key);

  @override
  State<ReadFolders> createState() => _ReadFoldersState();
}

class _ReadFoldersState extends State<ReadFolders> {
  DateTime know = DateTime.now();
  String formattedDate;

  var folders = [];
  var selected = [];
  var cli;
  var leng;
  var oop;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<downloadFileProvider>(context, listen: false)
            .fctListFolders());

    formattedDate = DateFormat('yyyy-MM-dd–kk-mm').format(know);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    var top = Get.statusBarHeight;

    folders =
        Provider.of<downloadFileProvider>(context, listen: true).listFolders;
    folders.sort((a, b) => b.toString().compareTo(a.toString()));
    folders.removeWhere((element) => element.toString().contains("user"));
    folders
        .removeWhere((element) => element.toString().contains("compilation"));
    folders.removeWhere((element) => element.toString().contains("vehicle"));
    folders.removeWhere((element) => element.toString().contains("zip"));

    return Scaffold(
        // appBar: AppBar(
        //   title: Text("List of inspections "),
        //   backgroundColor: Colors.black,
        //   actions: [
        //     selected.isNotEmpty
        //         ? IconButton(
        //             icon: Icon(
        //               Icons.send_and_archive,
        //               color: Colors.white,
        //             ),
        //             onPressed: () async {
        //               var result = " ";
        //               for (var i = 0; i < selected.length; i++) {
        //                 result += await File(selected[i] + "/Final report.json")
        //                     .readAsString();
        //               }
        //               print(result.toString());
        //               var d = await Directory(
        //                       "/storage/7E26-D83B/bridge/compilation" +
        //                           formattedDate.toString())
        //                   .create();
        //               await File("/storage/7E26-D83B/bridge/compilation" +
        //                       formattedDate.toString() +
        //                       "/all.json")
        //                   .writeAsString(result.toString());
        //               final zipFile = File(d.path + "_file.zip");
        //               var c4 = ZipFile.createFromDirectory(
        //                   sourceDir: d, zipFile: zipFile, recurseSubDirs: true);
        //               final Email send_email = Email(
        //                 body: 'your inspection is compressed',
        //                 subject: 'Inspection tyrematch',
        //                 recipients: [
        //                   'AG projects - Bridgestone <147c67b5.xflowdata.com@emea.teams.ms>'
        //                 ],
        //                 attachmentPaths: [d.path + "_file.zip"],
        //                 isHTML: false,
        //               );

        //               await FlutterEmailSender.send(send_email);
        //               await File(d.path + "_file.zip").delete();
        //               await Directory(d.path).delete();
        //               Navigator.pop(context);
        //             },
        //           )
        //         : Icon(Icons.select_all)
        //   ],
        // ),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Home(color: false),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15),
                  child:
                      Provider.of<downloadFileProvider>(context, listen: false)
                                  .status ==
                              "false"
                          ? Image.asset("assets/images/basic.png")
                          : Image.asset("assets/images/advanced.png"),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                color: const Color.fromARGB(255, 127, 127, 127),
                child: Center(
                  child: Text(
                    " Sessions list",
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
          folders.isEmpty
              ? Container(
                  child: Center(
                  child: Text("empty"),
                ))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: folders.length,
                      itemBuilder: (context, index) {
                        var test = false;
                        if (folders[index]
                            .runtimeType
                            .toString()
                            .contains('_Directory')) {
                          test = (folders[index]
                              .listSync()
                              .toString()
                              .contains("notsend"));
                        }
                        var ar = folders[index].toString().split('/');
                        return Card(
                          child: ListTile(
                            onLongPress: () {
                              if (selected.isNotEmpty) {
                                if (selected
                                    .contains(folders[index].path.toString())) {
                                  selected.removeWhere((element) =>
                                      element ==
                                      folders[index].path.toString());
                                  setState(() {});
                                } else {
                                  selected.add(folders[index].path.toString());
                                  setState(() {
                                    oop = Colors.blueAccent;
                                    leng = selected.length.toString();
                                  });
                                }
                              }
                            },
                            onTap: () async {
                              // print("tst :$test");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ReadFiles(
                                        path: (folders[index]),
                                        exist: test,
                                      )));
                            },
                            leading: Icon(
                              Icons.folder,
                              color: selected
                                      .contains(folders[index].path.toString())
                                  ? oop
                                  : null,
                            ),
                            trailing: test == true
                                ? Icon(
                                    Icons.dangerous_outlined,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                            title: Text(
                                "${ar[ar.length - 1].toString().substring(0, ar[ar.length - 1].toString().length - 1)}"),
                          ),
                        );
                      }),
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
    ));
  }
}

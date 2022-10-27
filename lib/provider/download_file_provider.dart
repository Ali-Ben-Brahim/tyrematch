import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_archive/flutter_archive.dart';

class downloadFileProvider with ChangeNotifier {
  bool loading = false;
  List _listFiles = [];
  List<String> _listModifyFolder = [
    "tyres",
    "inspections",
    "tyrematchInspections",
    "vehicles",
    "calculation"
  ];

  List<String> p10 = <String>['---'];

  List<String> p20 = <String>['---'];

  List<String> p30 = <String>['---'];

  List<String> p40 = <String>['---'];
  TextEditingController commentsDamage1Controller = TextEditingController();
  TextEditingController commentsDamage2Controller = TextEditingController();
    TextEditingController commentsDamage3Controller = TextEditingController();
      TextEditingController commentsDamage4Controller = TextEditingController();
  var id_damage1 = "";
  var id_damage2 = "";
  var id_damage3 = "";
  var id_damage4 = "";
  var typeDamage1 = '---';
  var typeDamage10 = '---';

  var typeDamage2 = '---';
  var typeDamage20 = '---';

  var typeDamage3 = '---';
  var typeDamage30 = '---';

  var typeDamage4 = '---';
  var typeDamage40 = '---';

  List<String> uniquelist1;

  List _listVehicles = [];
  List _listperVehicles = [];
  List _datelistperVehicles = [];
  bool ischaked1 = false;
  bool ischaked2 = false;
  bool ischaked3 = false;
  bool ischaked4 = false;

  String _sessionName;
  String _vehicleimagepath;
  String _mainPath;
  List _listFolders = [];
  List _listInspectionsPath = [];
  var _jsonfile;
  get jsonfile => _jsonfile;
  String get mainPath => _mainPath;
  String get sessionName => _sessionName;
  List get listFiles => _listFiles;
  List get listModifyFolder => _listModifyFolder;
  List get listVehicles => _listVehicles;
  List get listperVehicles => _listperVehicles;
  List get datelistperVehicles => _datelistperVehicles;

  List get listInspectionsPath => _listInspectionsPath;
  List get listFolders => _listFolders;
  var p1;
  bool _isP1 = true;
  bool get isP1 => _isP1;
  String get vehicleimagepath => _vehicleimagepath;

  get pp1 => p1;
  var _readjson;
  get readjson => _readjson;

  setReadjson(value) {
    _readjson = value;
    notifyListeners();
  }

  var _status;
  get status => _status;
  setStatut(value) {
    _status = value;
    notifyListeners();
  }

  bool _card = false;
  get card => _card;
  setcard(value) {
    _card = value;
    notifyListeners();
  }

  bool _card2 = false;
  get card2 => _card2;
  setcard2(value) {
    _card2 = value;
    notifyListeners();
  }

  bool _card3 = false;
  get card3 => _card3;
  setcard3(value) {
    _card3 = value;
    notifyListeners();
  }

  bool _card4 = false;
  get card4 => _card4;
  setcard4(value) {
    _card4 = value;
    notifyListeners();
  }

  var _calculation;
  get calculation => _calculation;
  setCalculation(value) {
    _calculation = value;
    notifyListeners();
  }

  var _inputPerformance;
  get inputPerformance => _inputPerformance;
  setPerformance(value) {
    _inputPerformance = value;
    notifyListeners();
  }

  var _name;
  get name => _name;
  setName(value) {
    _name = value;
    notifyListeners();
  }

  var _details;
  get details => _details;
  setDetails(value) {
    _details = value;
    notifyListeners();
  }

  var _performance;
  get performance => _performance;
  setperformance(value) {
    _performance = value;
    notifyListeners();
  }

  var _typehome;
  get typehome => _typehome;
  settypehome(value) {
    _typehome = value;
    notifyListeners();
  }

  var _Tyrematch;
  get Tyrematch => _Tyrematch;
  setTyrematch(value) {
    _Tyrematch = value;
    notifyListeners();
  }

  var _inputVehicule;
  get inputVehicule => _inputVehicule;
  setInputVehicule(value) {
    _inputVehicule = value;
    notifyListeners();
  }

  var _inputTyre;
  get inputTyre => _inputTyre;
  setInputTyre(value) {
    _inputTyre = value;
    notifyListeners();
  }

  var _inputInspection;
  get inputInspection => _inputInspection;
  setInputInspection(value) {
    _inputInspection = value;
    notifyListeners();
  }

  var _inputuser;
  get inputuser => _inputuser;
  setInputuser(value) {
    _inputuser = value;
    notifyListeners();
  }

  var _inputTyreInspection;
  get inputTyreInspection => _inputTyreInspection;
  setInputTyreInspection(value) {
    _inputTyreInspection = value;
    notifyListeners();
  }

  setIsP1(value) {
    _isP1 = value;
    notifyListeners();
  }

  changeLoading(value) {
    loading = value;
    notifyListeners();
  }

  setMainPath(value) {
    _mainPath = value;
    notifyListeners();
  }

  setP1(path) {
    p1 = Directory(path);
    notifyListeners();
  }

  setUser(_inputuser) async {
    Directory directory;

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          String newPath = "";
          List<String> paths = directory.path.split("/");
          print("directodirectodirecto" + directory.toString());
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
          directory.create();
          File userfile;
          userfile = File(newPath + "/user.json");
          var test100 = jsonEncode(_inputuser);
          print(test100);
          userfile.writeAsString(test100);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
    } catch (e) {}
  }

  getStringValuesSF() async {
    Directory directory;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String path = prefs.getString('path');
    if (path != null) {
      p1 = Directory(path);

      print(
          "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz : ${p1}");
      notifyListeners();
    }
  }

  Future<bool> saveFile(data, String fileName) async {
    Directory directory;
    try {
      File saveFile;

      if (_mainPath != null) {
        directory = Directory(_mainPath);
        saveFile = File("${_mainPath}/$fileName.json");
      } else {
        directory = p1;
        saveFile = File("${p1.path}/$fileName.json");
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        var test = jsonEncode(data);
        saveFile.writeAsStringSync(test, flush: true);

        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveFileV(
    data,
    String fileName,
    File f1,
  ) async {
    Directory directory;
    var newPath = "";

    print("object");
    File saveFile;
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
            newPath = newPath + "/bridge/vehicle";
            print("eeeeeeeeeeeeeeeeee" + newPath);
            directory = Directory(newPath);
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
            newPath = newPath + "/bridge/vehicle";
            directory = Directory(newPath);
          }
        }
      }

      // directory = newPath.pa;
      saveFile = File("${newPath}/$fileName.json");
      print(f1.toString());
      print("objectobjectobjectobjectf1" + newPath.toString());
      if (f1.toString() != "null") {
        print("objectobjectobjectobjectf1" + f1.toString());
        f1.copy(newPath + "/${fileName}.jpg");
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        var test = jsonEncode(data);
        saveFile.writeAsStringSync(test, flush: true);

        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
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

  downloadFile(data, name) async {
    changeLoading(true);
    bool downloaded = await saveFile(data, name);
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    changeLoading(false);
  }

  downloadFileV(data, name, photo) async {
    changeLoading(true);
    bool downloaded = await saveFileV(data, name, photo);
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    changeLoading(false);
  }

  fctListFiles(name) async {
    _listFiles = [];
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

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
          print("NAME $name");
          directory = name;
          print("NAME $name");
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (await directory.exists()) {
        List listDirectory = await directory.listSync();
        print("listDirectory :${listDirectory}");
        // _listFiles = listDirectory;
        // await _listFiles
        //     .removeWhere((item) => item.toString().contains("Vehicles.json"));
        // print(
        // "_listFiles_listFiles : ${_listFiles.contains('Final report.json')}");

        for (var i = 0; i < listDirectory.length; i++) {
          if (listDirectory[i].toString().contains('Final report') == true) {
            var ret = await listDirectory[i].readAsString();
            _readjson = jsonDecode(ret);
          }
        }
        // _listFiles.map((e) => print("eezeeeee : $e"));

        notifyListeners();
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  readFromFile2() async {}

  readFromFile(file) async {
    Directory directory;
    _jsonfile = [];
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

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
          newPath = newPath + "/bridge";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (await directory.exists()) {
        final fileContent = await file.readAsString();
        final json = await jsonDecode(fileContent);
        _jsonfile = await json;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  changeFile(file, data) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

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
          newPath = newPath + "/bridge";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      var ar = file.toString().split('/');
      File saveFile = file;
      if (await directory.exists()) {
        var test = jsonEncode(data);
        final fileContent = await file.writeAsStringSync(test, flush: true);
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }

      return false;
    } catch (e) {
      print(e);
    }
  }

  fctListFolders() async {
    Directory directory;
    _listFolders = [];
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

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
          newPath = newPath + "/bridge";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (await directory.exists()) {
        List listDirectory = await directory.listSync();
        _listFolders = listDirectory;
        notifyListeners();
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  fctListVehicles2(String val) async {
    var temp;
    Directory directory;
    _listVehicles = [];
    String newPath = "";

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/bridge";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      _listperVehicles.clear();
      _datelistperVehicles.clear();
      print("rami1998" + val.toString());
      if (await directory.exists()) {
        List listDirectory = await directory.listSync();
        print("_vehicles_vehicles_vehicles ${listDirectory}");

        //    for (var directorys in listDirectory) {
        //     print("+++++++++++++++++++ ${directorys}");
        // if (directorys is Directory) {
        // print("------------------ ${directorys}");
        //    if (directorys.runtimeType == '_File') {
        for (var files in await directory.listSync()) {
          print("FileFileFile1 ${files}");
          // if (files is File) {
          //               print("true");

          if (files is Directory) {
            //    print("true1");
            for (File file in await files.listSync()) {
              // print("true1"+file.toString());

              if (file.toString().contains("Final")) {
                print("true1" + file.readAsStringSync().toString());

                if (jsonDecode(file.readAsStringSync())
                    .toString()
                    .contains(val.toString())) {
                  print("rami1998" + file.readAsStringSync());

                  _listperVehicles.add(jsonEncode(file.readAsStringSync()));
                  temp = await file.lastModified();
                  _datelistperVehicles.add(temp);
                  print("ttt");

                  print(temp);

                  //   //  _vehicleimagepath = newPath;
                  //       }
                }
              }
            }
          }

          //    }
          //    }
        }
        //   }
        notifyListeners();
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  fctListVehicles() async {
    Directory directory;
    _listVehicles = [];
    String newPath = "";

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory());
          print("directodirectodirecto" + directory.toString());

          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/bridge/vehicle";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (await directory.exists()) {
        List listDirectory = await directory.listSync();
        print("_vehicles_vehicles_vehicles ${listDirectory}");

        //    for (var directorys in listDirectory) {
        //     print("+++++++++++++++++++ ${directorys}");
        // if (directorys is Directory) {
        // print("------------------ ${directorys}");
        //    if (directorys.runtimeType == '_File') {
        for (var files in await directory.listSync()) {
          print("FileFileFile ${files}");
          if (files is File) {
            //if (files is Directory) {
            //  for (File file in await files.listSync()) {
            if (files.toString().contains("vehicle")) {
              if (!files.toString().contains("jpg")) {
                print("xfcgsghzs" + _listVehicles.toString());
                _listVehicles.add(jsonDecode(files.readAsStringSync()));

                _vehicleimagepath = newPath;
              }
            }
          }
          //   }
          // }

          //    }
          //    }
        }
        //   }
        notifyListeners();
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  quit() async {
    var c4;
    try {
      final pref = await SharedPreferences.getInstance();
      var p = pref.getString("path");
      final dataDir = Directory(p);

      print("path ppppppppppp ${p}");
      try {
        final zipFile = File(p + "_file.zip");
        c4 = ZipFile.createFromDirectory(
            sourceDir: dataDir, zipFile: zipFile, recurseSubDirs: true);
        print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv ${await c4}");

        final Email send_email = Email(
          body: 'your inspection is compressed',
          subject: 'Inspection tyrematch',
          recipients: [
            'AG projects - Bridgestone <147c67b5.xflowdata.com@emea.teams.ms>'
          ],
          attachmentPaths: [p + "_file.zip"],
          isHTML: false,
        );

        await FlutterEmailSender.send(send_email);
      } catch (e) {
        print(e);
      }

      await pref.clear();
      _listModifyFolder = [];
      p1 = null;
      _mainPath = null;
      notifyListeners();
    } catch (_) {}
  }
}

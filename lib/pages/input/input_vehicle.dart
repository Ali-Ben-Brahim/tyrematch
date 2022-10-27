import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_app/pages/search_vehicle.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../provider/download_file_provider.dart';

class InputVehicle extends StatefulWidget {
  var BL;
  var vehicle;
  InputVehicle({
    Key key,
    this.BL,
    this.vehicle,
  }) : super(key: key);
  var color;
  @override
  State<InputVehicle> createState() => _InputVehicleState();
}

class _InputVehicleState extends State<InputVehicle> {
  var _inputVehicle = {};

  String value0;
  var selectBrand = '---';
  var selectModel = '---';
  String dropdownValue1 = '---';
  String dropdownValue2 = '---';
  String dropdownValue3 = '---';
  String dropdownValue4 = '---';
  String dropdownValue5 = '---';
  String dropdownValue6 = '---';
  bool dual1 = false;
  bool dual2 = false;
  List catalogdata;
  List catalogdata2;
  List catalogdata0;
  List catalogdata10;
  List<String> p1 = <String>['---'];
  List<String> prod1 = <String>['---'];
  List<String> p10 = <String>['---'];
  List<String> prod10 = <String>['---'];
  List<String> v = <String>['---'];
  List<String> v1 = <String>['---'];

  @override
  void initState() {
    super.initState();
    nbrAxiesController.text = "2";
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(
              'Please make sure that the registration plate {${rpController.text}} is correct. '),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 129, 17, 9)),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 50, 129, 54)),
              ),
              child: const Text(
                'Proceed',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onPressed: () async {
                print("aliali" + image.toString());
                if (image.toString().contains("data")) {
                  _inputVehicle = {
                    "Brand": selectBrand.toString(),
                    "Model": selectModel.toString(),
                    "Regestation_plate": rpController.text,
                    "Number_axles": nbrAxiesController.text,
                    "w_axle1": _Axies1Controller.text,
                    "w_axle2": _Axies2Controller.text,

// "vehicle_image":,
                    "TyreBrand_F": dropdownValue1.toString(),
                    "TyrePattern_F": dropdownValue3.toString(),
                    "TyreSize_F": dropdownValue5.toString(),
                    "TyreBrand_R": dropdownValue2.toString(),

                    "TyrePattern_R": dropdownValue4.toString(),
                    "TyreSize_R": dropdownValue6.toString(),

                    "date_creation": getCurrentDate().toString(),
                  };

                  Provider.of<downloadFileProvider>(context, listen: false)
                      .saveFileV(
                          _inputVehicle, "vehicle_${rpController.text}", image);
                  print("eeeee" + _inputVehicle.toString());
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchVehicle()));
                } else {
                  Navigator.of(context).pop();

                  final snackBar = SnackBar(
                    content: Text("You must take a picture for your vehicle "),
                    backgroundColor: Color.fromARGB(255, 119, 28, 22),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> loadData2(List p) async {
    var data = await rootBundle.loadString("assets/data/Vehicle.json");
    setState(() {
      catalogdata2 = json.decode(data);
    });
    print("cat" + catalogdata2.length.toString());
    print(catalogdata2[0]["Brand"].toString());
    for (var i = 0; i < catalogdata2.length; i++) {
      print("ggggggggg" + catalogdata2[i]["Brand"].toString());
      p.add(catalogdata2[i]["Brand"].toString());
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      v = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  Future<String> loadData20(String val, List p) async {
    for (var i = 0; i < catalogdata2.length; i++) {
      if (catalogdata2[i].toString().contains(val)) {
        p.add(catalogdata2[i]["Model"].toString());
      }
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      v1 = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  Future<String> loadData(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/$val.json");
    setState(() {
      catalogdata = json.decode(data);
    });
    print("cat" + catalogdata.length.toString());
    print(catalogdata[0]["Pattern"].toString());
    for (var i = 0; i < catalogdata.length; i++) {
      print("ggggggggg" + catalogdata[i]["Pattern"].toString());
      p.add(catalogdata[i]["Pattern"].toString());
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      p1 = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  Future<String> loadData0(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/$val.json");
    setState(() {
      catalogdata0 = json.decode(data);
    });
    print("cat" + catalogdata0.length.toString());
    print(catalogdata0[0]["Pattern"].toString());
    for (var i = 0; i < catalogdata0.length; i++) {
      print("ggggggggg" + catalogdata0[i]["Pattern"].toString());
      p.add(catalogdata0[i]["Pattern"].toString());
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      p10 = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  Future<String> loadDataprod(String val, List p) async {
    for (var i = 0; i < catalogdata.length; i++) {
      if (catalogdata[i].toString().contains(val)) {
        p.add(catalogdata[i]["Product"].toString());
      }
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      prod1 = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  Future<String> loadDataprod0(String val, List p) async {
    for (var i = 0; i < catalogdata0.length; i++) {
      if (catalogdata0[i].toString().contains(val)) {
        p.add(catalogdata0[i]["Product"].toString());
      }
    }
    var seen = Set<String>();
    List<String> uniquelist = p.where((element) => seen.add(element)).toList();
    print("ffff" + uniquelist.toString());
    setState(() {
      prod10 = uniquelist;
    });
    print("ffff1" + p.toString());

    return "success";
  }

  getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  String selectedApplication;

  var top = Get.statusBarHeight;
  bool active = false;
  final formKey = GlobalKey<FormState>();

  File image;
  final imagepicker = ImagePicker();
  PickedFile _imageFile;
  uploadImage() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);

      setState(() {
        _imageFile = pickedImage;
        print(image.path.toString());
      });
    } else {}
  }

  TextEditingController rpController = TextEditingController();
  TextEditingController nbrAxiesController = TextEditingController();
  final TextEditingController _Axies1Controller = TextEditingController();
  final TextEditingController _Axies2Controller = TextEditingController();
  final TextEditingController _Axies3Controller = TextEditingController();
  List axies = [];
  Future<void> _showMyDialog(int i) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Axles weights '),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Text('Axies 1 = '),
                            Expanded(
                                child: TextFormField(
                              controller: _Axies1Controller,
                              decoration: InputDecoration(
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
                            )),
                            Text(' Kg'),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Text('Axies 2 = '),
                            Expanded(
                                child: TextFormField(
                              controller: _Axies2Controller,
                              decoration: InputDecoration(
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
                            )),
                            Text(' Kg'),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A8522)),
                      ),
                      onPressed: () {
                        setState(() {
                          axies.addAll(
                              [_Axies1Controller.text, _Axies2Controller.text]);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ],
          );
        });
  }

  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (v.length < 2) {
      loadData2(v);
    }
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: PageView(
          controller: page,
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          children: [
            Container(
              child: Form(
                key: formKey,
                child: Center(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40.0, vertical: 15),
                                            child: Provider.of<downloadFileProvider>(
                                                            context,
                                                            listen: false)
                                                        .status ==
                                                    "false"
                                                ? Image.asset(
                                                    "assets/images/basic.png")
                                                : Image.asset(
                                                    "assets/images/advanced.png"),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            color: const Color.fromARGB(
                                                255, 127, 127, 127),
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Brand',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: DropdownSearch<String>(
                                                selectedItem: selectBrand,
                                                popupProps: PopupProps.menu(
                                                  showSearchBox: true,
                                                ),
                                                items: v,
                                                onChanged: (String newValue1) {
                                                  setState(() {
                                                    selectBrand = newValue1;
                                                    v1 = ['---'];
                                                    selectModel = '---';
                                                  });

                                                  loadData20(selectBrand, v1);
                                                },
                                                dropdownDecoratorProps:
                                                    DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 5,
                                                            vertical: 10.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),

                                                  // value: selectBrand,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Model',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: DropdownSearch<String>(
                                                selectedItem: selectModel,
                                                items: v1,
                                                onChanged: (val) {
                                                  setState(() {
                                                    selectModel = val;
                                                  });
                                                },
                                                popupProps: PopupProps.menu(
                                                  showSearchBox: true,
                                                ),
                                                dropdownDecoratorProps:
                                                    DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 5,
                                                            vertical: 10.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Registration plate',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Form(
                                              child: TextFormField(
                                                controller: rpController,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5,
                                                          vertical: 10.0),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Number of Axles',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: TextFormField(
                                                readOnly: true,
                                                validator: (value) =>
                                                    value == null ||
                                                            value.isEmpty
                                                        ? 'Required'
                                                        : null,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: nbrAxiesController,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5,
                                                          vertical: 10.0),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 42, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (formKey.currentState
                                                  .validate()) {
                                                _showMyDialog(int.parse(
                                                    nbrAxiesController.text));
                                              }
                                            },
                                            child: const Text(
                                              'Add weight per axle',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2E7402),
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 42, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Add vehicle photo',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: uploadImage,
                                            child: CircleAvatar(
                                              radius: 42,
                                              backgroundColor: Colors.black,
                                              child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: image == null
                                                      ? AssetImage(
                                                          "assets/images/camera.png")
                                                      : FileImage(
                                                          File(image.path)),
                                                  backgroundColor:
                                                      Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xFF4A8522)),
                                            ),
                                            onPressed: () {
                                              page.animateToPage(++pageIndex,
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                  curve:
                                                      Curves.linearToEaseOut);
                                            },
                                            child: Text(
                                              "Next",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ),
                                      //    image != null ? Image.file(image) : Text("no chosen image"),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/Bridgestone-Logo.png",
                                          width: 200,
                                        ),
                                      )
                                    ]),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 15),
                                        child: Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .status ==
                                                "false"
                                            ? Image.asset(
                                                "assets/images/basic.png")
                                            : Image.asset(
                                                "assets/images/advanced.png"),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        color: const Color.fromARGB(
                                            255, 127, 127, 127),
                                        child: Center(
                                          child: Text(
                                            "Vehicle tyres",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child:
                                          Image.asset("assets/images/Sans.png"),
                                    ),
                                    Container(
                                      height: 300,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) *
                                                  0.9,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Tyre Brand",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              12)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                onChanged: (String
                                                                    newValue) {
                                                                  setState(() {
                                                                    dropdownValue1 =
                                                                        newValue;
                                                                    p1 = [
                                                                      '---'
                                                                    ];
                                                                    dropdownValue3 =
                                                                        '---';
                                                                  });

                                                                  loadData(
                                                                      newValue,
                                                                      p1);
                                                                },
                                                                items: <String>[
                                                                  '---',
                                                                  'ALLIANCE',
                                                                  'BKT',
                                                                  'BRIDGESTONE',
                                                                  'CONTINENTAL',
                                                                  'FIRESTONE',
                                                                  'GOODYEAR',
                                                                  'KLEBER',
                                                                  'MICHELIN',
                                                                  'MITAS',
                                                                  'TITAN',
                                                                  'TRELLEBORG',
                                                                  'VREDESTEIN'
                                                                ],
                                                                selectedItem:
                                                                    dropdownValue1,
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    //   width: MediaQuery.of(context).size.width / 2.4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Tyre pattern",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              13)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                selectedItem:
                                                                    dropdownValue3,
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                items: p1,
                                                                onChanged: (String
                                                                    newValue1) {
                                                                  setState(() {
                                                                    dropdownValue3 =
                                                                        newValue1;
                                                                    prod1 = [
                                                                      '---'
                                                                    ];
                                                                    dropdownValue5 =
                                                                        '---';
                                                                  });

                                                                  loadDataprod(
                                                                      newValue1,
                                                                      prod1);
                                                                },
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    //   width: MediaQuery.of(context).size.width / 2.4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Product",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              13)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                items: prod1,
                                                                selectedItem:
                                                                    dropdownValue5,
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                onChanged: (String
                                                                    newValue5) {
                                                                  setState(() {
                                                                    dropdownValue5 =
                                                                        newValue5;
                                                                  });
                                                                },
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),

                                                  // Expanded(
                                                  //   //   width: MediaQuery.of(context).size.width / 2.4,
                                                  //   child: Row(
                                                  //     children: [
                                                  //       Text("Dual"),
                                                  //       Checkbox(
                                                  //         value: this.dual2,
                                                  //         onChanged: (bool value) {
                                                  //           setState(() {
                                                  //             this.dual2 = value;
                                                  //           });
                                                  //         },
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            VerticalDivider(
                                              width: 10,
                                              thickness: 1,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) *
                                                  0.9,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Tyre Brand",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              13)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                onChanged: (String
                                                                    newValue) {
                                                                  setState(() {
                                                                    dropdownValue2 =
                                                                        newValue;
                                                                    p10 = [
                                                                      '---'
                                                                    ];
                                                                    dropdownValue4 =
                                                                        '---';
                                                                  });

                                                                  loadData0(
                                                                      newValue,
                                                                      p10);
                                                                },
                                                                selectedItem:
                                                                    dropdownValue2,
                                                                items: <String>[
                                                                  '---',
                                                                  'ALLIANCE',
                                                                  'BKT',
                                                                  'BRIDGESTONE',
                                                                  'CONTINENTAL',
                                                                  'FIRESTONE',
                                                                  'GOODYEAR',
                                                                  'KLEBER',
                                                                  'MICHELIN',
                                                                  'MITAS',
                                                                  'TITAN',
                                                                  'TRELLEBORG',
                                                                  'VREDESTEIN'
                                                                ],
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    // width: MediaQuery.of(context).size.width / 2.4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Tyre pattern",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              13)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                onChanged: (String
                                                                    newValue1) {
                                                                  setState(() {
                                                                    dropdownValue4 =
                                                                        newValue1;
                                                                    prod10 = [
                                                                      '---'
                                                                    ];
                                                                    dropdownValue6 =
                                                                        '---';
                                                                  });

                                                                  loadDataprod0(
                                                                      newValue1,
                                                                      prod10);
                                                                },
                                                                items: p10,
                                                                selectedItem:
                                                                    dropdownValue4,
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    // width: MediaQuery.of(context).size.width / 2.4,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Product",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        Theme(
                                                            data: ThemeData(
                                                              textTheme: TextTheme(
                                                                  subtitle1:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              12)),
                                                            ),
                                                            child: DropdownSearch<
                                                                    String>(
                                                                onChanged: (String
                                                                    newValue5) {
                                                                  setState(() {
                                                                    dropdownValue6 =
                                                                        newValue5;
                                                                  });
                                                                },
                                                                selectedItem:
                                                                    dropdownValue6,
                                                                popupProps:
                                                                    PopupProps
                                                                        .menu(
                                                                  showSearchBox:
                                                                      true,
                                                                ),
                                                                items: prod10,
                                                                dropdownDecoratorProps:
                                                                    DropDownDecoratorProps(
                                                                  dropdownSearchDecoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            10.0),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              width: 1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                )))
                                                      ],
                                                    ),
                                                  ),
                                                  // Expanded(
                                                  //   child: Row(
                                                  //     children: [
                                                  //       Text("Dual"),
                                                  //       Checkbox(
                                                  //         value: this.dual1,
                                                  //         onChanged: (bool value) {
                                                  //           setState(() {
                                                  //             this.dual1 = value;
                                                  //           });
                                                  //         },
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                )),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xFF4A8522)),
                                            ),
                                            onPressed: () {
                                              _dialogBuilder(context);
                                            },
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            )),
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
    ));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/download_file_provider.dart';
import 'home.dart';
import 'input/input_photograph.dart';

class Test extends StatefulWidget {
  var j;
  Test({Key key, this.j}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool card1 = false;
  bool card2 = false;
  bool card3 = false;
  bool card4 = false;
  var selectDamage;

  TextEditingController _dateController = TextEditingController();
  TextEditingController _hourController = TextEditingController();
  TextEditingController _rtdOneController = TextEditingController();
  TextEditingController _rtdTwoController = TextEditingController();
  TextEditingController _rtdTreeController = TextEditingController();
  TextEditingController _rtdFourController = TextEditingController();
  TextEditingController _ipOneController = TextEditingController();
  TextEditingController _ipTwoController = TextEditingController();
  TextEditingController _ipThreeController = TextEditingController();
  TextEditingController _ipFourController = TextEditingController();

  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

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

  @override
  void initState() {
    _dateController.text = getCurrentDate().toString();
    // TODO: implement initState

    if (widget.j == true) {
      var data = Provider.of<downloadFileProvider>(context, listen: false)
          .inputTyreInspection;
      print("ali" + data.toString());
    }
    super.initState();
  }

  List catalogdata1;
  List<String> p1 = <String>['---'];

  List<String> uniquelist1;

  chtype2(var val, var val1, var res) async {
    List cat8;

    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      cat8 = json.decode(data);
    });
    for (var i = 0; i < cat8.length; i++) {
      if (cat8[i]["Area"].toString().contains(val.toString()) &&
          cat8[i]["Damage"].toString().contains(val1.toString())) {
        print("4444" + catalogdata1.toString());

        print("ooooooooooooooooooooooooo" +
            catalogdata1[i]["Id Damage"].toString());
        setState(() {
          id_damage2 = catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
    print("mmmmmmmmmmm" + id_damage1.toString());
  }

  chtype3(var val, var val1, var res) async {
    List cat8;

    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      cat8 = json.decode(data);
    });
    for (var i = 0; i < cat8.length; i++) {
      if (cat8[i]["Area"].toString().contains(val.toString()) &&
          cat8[i]["Damage"].toString().contains(val1.toString())) {
        print("4444" + catalogdata1.toString());

        print("ooooooooooooooooooooooooo" +
            catalogdata1[i]["Id Damage"].toString());
        setState(() {
          id_damage3 = catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
    print("mmmmmmmmmmm" + id_damage1.toString());
  }

  chtype4(var val, var val1, var res) async {
    List cat8;

    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      cat8 = json.decode(data);
    });
    for (var i = 0; i < cat8.length; i++) {
      if (cat8[i]["Area"].toString().contains(val.toString()) &&
          cat8[i]["Damage"].toString().contains(val1.toString())) {
        print("4444" + catalogdata1.toString());

        print("ooooooooooooooooooooooooo" +
            catalogdata1[i]["Id Damage"].toString());
        setState(() {
          id_damage4 = catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
    print("mmmmmmmmmmm" + id_damage1.toString());
  }

  chtype1(var val, var val1, var res) async {
    List cat8;

    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      cat8 = json.decode(data);
    });
    for (var i = 0; i < cat8.length; i++) {
      if (cat8[i]["Area"].toString().contains(val.toString()) &&
          cat8[i]["Damage"].toString().contains(val1.toString())) {
        print("4444" + catalogdata1.toString());

        print("ooooooooooooooooooooooooo" +
            catalogdata1[i]["Id Damage"].toString());
        setState(() {
          id_damage1 = catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
    print("mmmmmmmmmmm" + id_damage1.toString());
  }

  Future<String> loadData1(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      catalogdata1 = json.decode(data);
    });
    print("zzzzzzz" + catalogdata1.toString());
    for (var i = 0; i < catalogdata1.length; i++) {
      if (catalogdata1[i]["Area"].toString().contains(val)) {
        print("tttt" + catalogdata1.toString());
        p.add(catalogdata1[i]["Damage"].toString());
      }
    }
    var seen = Set<String>();
    uniquelist1 = p.where((element) => seen.add(element)).toList();
    setState(() {
      p1 = uniquelist1;
    });
    print("ffff1" + p1.toString());
    // Provider.of<downloadFileProvider>(context, listen: false).setDam1(p1
    //     .map((e) => DropdownMenuItem(
    //           value: e,
    //           child: Text(e),
    //         ))
    //     .toList());
    return "success";
  }

  List<String> p2 = <String>['---'];

  List<String> uniquelist2;
  List catalogdata2;
  Future<String> loadData2(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      catalogdata2 = json.decode(data);
    });
    print("zzzzzzz" + catalogdata2.toString());
    for (var i = 0; i < catalogdata2.length; i++) {
      if (catalogdata2[i]["Area"].toString().contains(val)) {
        print("tttt" + catalogdata2.toString());
        p.add(catalogdata2[i]["Damage"].toString());
      }
    }
    var seen = Set<String>();
    uniquelist2 = p.where((element) => seen.add(element)).toList();
    setState(() {
      p2 = uniquelist2;
    });
    print("ffff1" + p2.toString());
    // Provider.of<downloadFileProvider>(context, listen: false).setDam1(p1
    //     .map((e) => DropdownMenuItem(
    //           value: e,
    //           child: Text(e),
    //         ))
    //     .toList());
    return "success";
  }

  List<String> p3 = <String>['---'];

  List<String> uniquelist3;
  List catalogdata3;
  Future<String> loadData3(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      catalogdata3 = json.decode(data);
    });
    print("zzzzzzz" + catalogdata3.toString());
    for (var i = 0; i < catalogdata3.length; i++) {
      if (catalogdata3[i]["Area"].toString().contains(val)) {
        print("tttt" + catalogdata3.toString());
        p.add(catalogdata3[i]["Damage"].toString());
      }
    }
    var seen = Set<String>();
    uniquelist3 = p.where((element) => seen.add(element)).toList();
    setState(() {
      p3 = uniquelist3;
    });
    print("ffff1" + p1.toString());
    // Provider.of<downloadFileProvider>(context, listen: false).setDam1(p1
    //     .map((e) => DropdownMenuItem(
    //           value: e,
    //           child: Text(e),
    //         ))
    //     .toList());
    return "success";
  }

  List<String> uniquelist4;
  List<String> p4 = <String>['---'];
  List catalogdata4;

  Future<String> loadData4(String val, List p) async {
    var data = await rootBundle.loadString("assets/data/Damage.json");
    setState(() {
      catalogdata4 = json.decode(data);
    });
    print("zzzzzzz" + catalogdata4.toString());
    for (var i = 0; i < catalogdata4.length; i++) {
      if (catalogdata4[i]["Area"].toString().contains(val)) {
        print("tttt" + catalogdata4.toString());
        p.add(catalogdata4[i]["Damage"].toString());
      }
    }
    var seen = Set<String>();
    uniquelist4 = p.where((element) => seen.add(element)).toList();
    setState(() {
      p4 = uniquelist4;
    });
    print("ffff1" + p1.toString());
    // Provider.of<downloadFileProvider>(context, listen: false).setDam1(p1
    //     .map((e) => DropdownMenuItem(
    //           value: e,
    //           child: Text(e),
    //         ))
    //     .toList());
    return "success";
  }

  Map tyreInspection = {};

  final TextEditingController _commentsDamage1Controller =
      TextEditingController();
  final TextEditingController _commentsDamage2Controller =
      TextEditingController();
  final TextEditingController _commentsDamage3Controller =
      TextEditingController();
  final TextEditingController _commentsDamage4Controller =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

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
                child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            height: h * 0.96,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: h,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                color: const Color.fromARGB(255, 127, 127, 127),
                                child: Center(
                                  child: Text(
                                    "Tyre inspection",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      width: w / 5,
                                      child: Text(
                                        'Date',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: TextFormField(
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      width: w / 5,
                                      child: Text(
                                        'Hours',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: Form(
                                    key: formkey,
                                    child: TextFormField(
                                      validator: (value) =>
                                          value.isEmpty ? 'Required' : null,
                                      keyboardType: TextInputType.number,
                                      controller: _hourController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                             
                              Container(
                                  height: h / 2.5,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/Sans2.png",
                                        ),
                                        fit: BoxFit.contain),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: 
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  child: Container(
                                                    height: h * 0.15,
                                                    color: Colors.green[100],
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Flexible(
                                                                    child: Text(
                                                                      'RTD',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          TextFormField(
                                                                        inputFormatters: <
                                                                            TextInputFormatter>[
                                                                          FilteringTextInputFormatter.allow(
                                                                              RegExp("^[0-9][0-9]?\$|^100\$"))
                                                                        ],
                                                                        keyboardType:
                                                                            TextInputType.numberWithOptions(),
                                                                        controller:
                                                                            _rtdOneController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 5,
                                                                              vertical: 10.0),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Flexible(
                                                                    child: Text(
                                                                      'IP',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        controller:
                                                                            _ipOneController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 5,
                                                                              vertical: 10.0),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      1),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Center(
                                                                        child: Container(
                                                                            alignment: Alignment.center,
                                                                            width: 14,
                                                                            height: 14,
                                                                            color: Colors.white,
                                                                            child: Checkbox(
                                                                              checkColor: Colors.black,
                                                                              fillColor: MaterialStateProperty.all(Colors.white),
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                side: MaterialStateBorderSide.resolveWith(
                                                                                  (states) => BorderSide(style: BorderStyle.solid, width: 1.0, color: Colors.black),
                                                                                ),
                                                                              ),
                                                                              value: isChecked,
                                                                              onChanged: (bool value) {
                                                                                setState(() {
                                                                                  isChecked = value;
                                                                                  card1 = value;
                                                                                  card2 = false;
                                                                                  card3 = false;
                                                                                  card4 = false;
                                                                                  // if (isChecked == true) {
                                                                                  //   _showDamage(typedamage1(), _commentsDamage1Controller);
                                                                                  // }
                                                                                });
                                                                              },
                                                                            )),
                                                                      )),
                                                                  const Flexible(
                                                                    flex: 3,
                                                                    child: Text(
                                                                      'Damage',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                               
                                                SizedBox(
                                                  width: 120,
                                                  child: Container(
                                                    height: h * 0.15,
                                                    color: Colors.green[100],
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Flexible(
                                                                    child: Text(
                                                                      'RTD',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        inputFormatters: <
                                                                            TextInputFormatter>[
                                                                          FilteringTextInputFormatter.allow(
                                                                              RegExp("^[0-9][0-9]?\$|^100\$"))
                                                                        ],
                                                                        controller:
                                                                            _rtdTwoController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 5,
                                                                              vertical: 10.0),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Flexible(
                                                                    child: Text(
                                                                      'IP',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          TextFormField(
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        controller:
                                                                            _ipTwoController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 5,
                                                                              vertical: 10.0),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(width: 1),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      1),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Center(
                                                                        child: Container(
                                                                            alignment: Alignment.center,
                                                                            width: 14,
                                                                            height: 14,
                                                                            color: Colors.white,
                                                                            child: Checkbox(
                                                                              checkColor: Colors.black,
                                                                              fillColor: MaterialStateProperty.all(Colors.white),
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                side: MaterialStateBorderSide.resolveWith(
                                                                                  (states) => BorderSide(style: BorderStyle.solid, width: 1.0, color: Colors.black),
                                                                                ),
                                                                              ),
                                                                              value: isChecked2,
                                                                              onChanged: (bool value) {
                                                                                setState(() {
                                                                                  isChecked2 = value;
                                                                                  card2 = value;
                                                                                  card4 = false;
                                                                                  card3 = false;
                                                                                  card1 = false;
                                                                                  // if (isChecked == true) {
                                                                                  //   _showDamage(typedamage1(), _commentsDamage1Controller);
                                                                                  // }
                                                                                });
                                                                              },
                                                                            )),
                                                                      )),
                                                                  const Flexible(
                                                                    flex: 3,
                                                                    child: Text(
                                                                      'Damage',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Flexible(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: Container(
                                                  height: h * 0.15,
                                                  color: Colors.green[100],
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Flexible(
                                                                  child: Text(
                                                                    'RTD',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        TextFormField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: <
                                                                          TextInputFormatter>[
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp("^[0-9][0-9]?\$|^100\$"))
                                                                      ],
                                                                      controller:
                                                                          _rtdTreeController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5,
                                                                            vertical:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Flexible(
                                                                  child: Text(
                                                                    'IP',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        TextFormField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          _ipThreeController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5,
                                                                            vertical:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        1),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Center(
                                                                      child: Container(
                                                                          alignment: Alignment.center,
                                                                          width: 14,
                                                                          height: 14,
                                                                          color: Colors.white,
                                                                          child: Checkbox(
                                                                            checkColor:
                                                                                Colors.black,
                                                                            fillColor:
                                                                                MaterialStateProperty.all(Colors.white),
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                              side: MaterialStateBorderSide.resolveWith(
                                                                                (states) => BorderSide(style: BorderStyle.solid, width: 1.0, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            value:
                                                                                isChecked3,
                                                                            onChanged:
                                                                                (bool value) {
                                                                              setState(() {
                                                                                isChecked3 = value;
                                                                                card3 = value;
                                                                                card2 = false;
                                                                                card4 = false;
                                                                                card1 = false;
                                                                                // if (isChecked == true) {
                                                                                //   _showDamage(typedamage1(), _commentsDamage1Controller);
                                                                                // }
                                                                              });
                                                                            },
                                                                          )),
                                                                    )),
                                                                const Flexible(
                                                                  flex: 3,
                                                                  child: Text(
                                                                    'Damage',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: Container(
                                                  height: h * 0.15,
                                                  color: Colors.green[100],
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Flexible(
                                                                  child: Text(
                                                                    'RTD',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        TextFormField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: <
                                                                          TextInputFormatter>[
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp("^[0-9][0-9]?\$|^100\$"))
                                                                      ],
                                                                      controller:
                                                                          _rtdFourController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5,
                                                                            vertical:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Flexible(
                                                                  child: Text(
                                                                    'IP',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        TextFormField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          _ipFourController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5,
                                                                            vertical:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        1),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Center(
                                                                      child: Container(
                                                                          alignment: Alignment.center,
                                                                          width: 14,
                                                                          height: 14,
                                                                          color: Colors.white,
                                                                          child: Checkbox(
                                                                            checkColor:
                                                                                Colors.black,
                                                                            fillColor:
                                                                                MaterialStateProperty.all(Colors.white),
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(2.0),
                                                                              side: MaterialStateBorderSide.resolveWith(
                                                                                (states) => BorderSide(style: BorderStyle.solid, width: 1.0, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            value:
                                                                                isChecked4,
                                                                            onChanged:
                                                                                (bool value) {
                                                                              setState(() {
                                                                                isChecked4 = value;
                                                                                card4 = value;
                                                                                card2 = false;
                                                                                card3 = false;
                                                                                card1 = false;
                                                                                // if (isChecked == true) {
                                                                                //   _showDamage(typedamage1(), _commentsDamage1Controller);
                                                                                // }
                                                                              });
                                                                            },
                                                                          )),
                                                                    )),
                                                                const Flexible(
                                                                  flex: 3,
                                                                  child: Text(
                                                                    'Damage',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                           
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF4A8522)),
                            ),
                            onPressed: () {
                              if (formkey.currentState.validate()) {
                                setState(() {
                                  tyreInspection = {
                                    "date": "${_dateController.text}",
                                    "hours": "${_hourController.text}",
                                    "RTD1": "${_rtdOneController.text}",
                                    "RTD2": "${_rtdTwoController.text}",
                                    "RTD3": "${_rtdTreeController.text}",
                                    "RTD4": "${_rtdFourController.text}",
                                    "Ip1": "${_ipOneController.text}",
                                    "IP2": "${_ipTwoController.text}",
                                    "IP3": "${_ipThreeController.text}",
                                    "IP4": "${_ipFourController.text}",
                                    "Type-Damage1": "$id_damage1",
                                    "Type-Damage2": "$id_damage2",
                                    "Type-Damage3": "$id_damage3",
                                    "Type-Damage4": "$id_damage4",
                                    "Comments-damage1":
                                        "${_commentsDamage1Controller.text}",
                                    "Comments-damage2":
                                        "${_commentsDamage2Controller.text}",
                                    "Comments-damage3":
                                        "${_commentsDamage3Controller.text}",
                                    "Comments-damage4":
                                        "${_commentsDamage4Controller.text}",
                                  };
                                });
                                print("gggggggggggggggggggggg" +
                                    tyreInspection.toString());
                                Provider.of<downloadFileProvider>(context,
                                        listen: false)
                                    .setInputTyreInspection(tyreInspection);
                                print("vvvvvvvvvvvvv" +
                                    Provider.of<downloadFileProvider>(context,
                                            listen: false)
                                        .inputTyreInspection
                                        .toString());
                                print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" +
                                    id_damage1.toString());
                                var st = 1;
                                if (widget.j == true) {
                                  Navigator.of(context).pop();
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => InputPhotographs(
                                            st: st,
                                          )));
                                }
                              }
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(fontWeight: FontWeight.w700),
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
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Visibility(
                      visible: card1,
                      child: Container(
                        height: h * 0.6,
                        width: w * 0.9,
                        child: Card(
                          elevation: 20,
                          child: Center(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          card1 = false;
                                          isChecked = false;
                                          typeDamage1  = '---';
                                          typeDamage10 = '---';
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                      color: Colors.red,
                                      iconSize: 30),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Damage description",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Area',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: [
                                              '---',
                                              'Bead',
                                              'Shoulder',
                                              'Sidewall',
                                              'Tread'
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage1,
                                            onChanged: (val) async {
                                              setState(() {
                                                typeDamage1 = val;
                                                p1 = ['---'];
                                                typeDamage10 = '---';
                                                loadData1(typeDamage1, p1);
                                              });
                                              print("gggggggggggggggggggggg" +
                                                  p1.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Damage',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: p1
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage10,
                                            onChanged: (val) {
                                              setState(() {
                                                typeDamage10 = val;

                                                // loadData2(typeDamage1, p1);
                                              });
                                              chtype1(typeDamage1, typeDamage10,
                                                  id_damage1);
                                              // print("ggggggggggggggg1ggggggg" +
                                              //     Provider.of<downloadFileProvider>(context, listen: false)
                                              //         .dam1
                                              //         .toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Comments',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                              controller:
                                                  _commentsDamage1Controller,
                                              keyboardType: TextInputType
                                                  .multiline,
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black)))),
                                        )
                                      ],
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
                                        onPressed: () {
                                          setState(() {
                                            card1 = false;
                                          });
                                        },
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
               
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Visibility(
                      visible: card2,
                      child: Container(
                        height: h * 0.6,
                        width: w * 0.9,
                        child: Card(
                          elevation: 20,
                          child: Center(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          card2 = false;
                                          isChecked2 = false;
                                          typeDamage2 = '---';
                                          typeDamage20 = '---';
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                      color: Colors.red,
                                      iconSize: 30),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Damage description",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Area',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: [
                                              '---',
                                              'Bead',
                                              'Shoulder',
                                              'Sidewall',
                                              'Tread'
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage2,
                                            onChanged: (val) async {
                                              setState(() {
                                                typeDamage2 = val;
                                                p2 = ['---'];
                                                typeDamage20 = '---';
                                                loadData2(typeDamage2, p1);
                                              });
                                              print("gggggggggggggggggggggg" +
                                                  p1.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Damage',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: p2
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage20,
                                            onChanged: (val) {
                                              setState(() {
                                                typeDamage20 = val;
                                                // loadData2(typeDamage1, p1);
                                              });
                                              chtype2(typeDamage2, typeDamage20,
                                                  id_damage2);
                                              // print("ggggggggggggggg1ggggggg" +
                                              //     Provider.of<downloadFileProvider>(context, listen: false)
                                              //         .dam1
                                              //         .toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Comments',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                              controller:
                                                  _commentsDamage2Controller,
                                              keyboardType: TextInputType
                                                  .multiline,
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black)))),
                                        )
                                      ],
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
                                        onPressed: () {
                                          setState(() {
                                            card2 = false;
                                          });
                                        },
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Visibility(
                      visible: card3,
                      child: Container(
                        height: h * 0.6,
                        width: w * 0.9,
                        child: Card(
                          elevation: 20,
                          child: Center(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          card3 = false;
                                          isChecked3 = false;
                                          typeDamage3 = '---';
                                          typeDamage30 = '---';
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                      color: Colors.red,
                                      iconSize: 30),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Damage description",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Area',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: [
                                              '---',
                                              'Bead',
                                              'Shoulder',
                                              'Sidewall',
                                              'Tread'
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage3,
                                            onChanged: (val) async {
                                              setState(() {
                                                typeDamage3 = val;
                                                p3 = ['---'];
                                                typeDamage30 = '---';
                                                loadData3(typeDamage3, p1);
                                              });
                                              print("gggggggggggggggggggggg" +
                                                  p1.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Damage',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: p3
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage30,
                                            onChanged: (val) {
                                              setState(() {
                                                typeDamage30 = val;
                                                // loadData2(typeDamage1, p1);
                                              });
                                              chtype3(typeDamage3, typeDamage30,
                                                  id_damage3);
                                              // print("ggggggggggggggg1ggggggg" +
                                              //     Provider.of<downloadFileProvider>(context, listen: false)
                                              //         .dam1
                                              //         .toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Comments',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                              controller:
                                                  _commentsDamage3Controller,
                                              keyboardType: TextInputType
                                                  .multiline,
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black)))),
                                        )
                                      ],
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
                                        onPressed: () {
                                          setState(() {
                                            card3 = false;
                                          });
                                        },
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Visibility(
                      visible: card4,
                      child: Container(
                        height: h * 0.6,
                        width: w * 0.9,
                        child: Card(
                          elevation: 20,
                          child: Center(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          card4 = false;
                                          isChecked4 = false;
                                          typeDamage4 = '---';
                                          typeDamage40 = '---';
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                      color: Colors.red,
                                      iconSize: 30),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Damage description",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Area',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: [
                                              '---',
                                              'Bead',
                                              'Shoulder',
                                              'Sidewall',
                                              'Tread'
                                            ]
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage4,
                                            onChanged: (val) async {
                                              setState(() {
                                                typeDamage4 = val;
                                                p4 = ['---'];
                                                typeDamage40 = '---';
                                                loadData4(typeDamage4, p1);
                                              });
                                              print("gggggggggggggggggggggg" +
                                                  p1.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Damage',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            items: p4
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            value: typeDamage40,
                                            onChanged: (val) {
                                              setState(() {
                                                typeDamage40 = val;
                                                // loadData2(typeDamage1, p1);
                                              });
                                              chtype4(typeDamage4, typeDamage40,
                                                  id_damage4);
                                              // print("ggggggggggggggg1ggggggg" +
                                              //     Provider.of<downloadFileProvider>(context, listen: false)
                                              //         .dam1
                                              //         .toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 100,
                                            child: Text(
                                              'Comments',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                              controller:
                                                  _commentsDamage4Controller,
                                              keyboardType: TextInputType
                                                  .multiline,
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black)))),
                                        )
                                      ],
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
                                        onPressed: () {
                                          setState(() {
                                            card4 = false;
                                          });
                                        },
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ))),
      ),
    ));
  }
}

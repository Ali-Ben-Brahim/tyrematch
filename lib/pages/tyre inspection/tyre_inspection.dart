import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../maquette/footer.dart';
import '../../maquette/header.dart';
import '../../provider/download_file_provider.dart';
import 'tyre_inspection_body.dart';

class TyreInspection extends StatefulWidget {
  TyreInspection({Key key}) : super(key: key);

  @override
  State<TyreInspection> createState() => _TyreInspectionState();
}

class _TyreInspectionState extends State<TyreInspection> {

  @override
  void initState() {

    super.initState();
  }

 

  List catalogdata1;

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
          Provider.of<downloadFileProvider>(context, listen: false).id_damage2 =
              catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
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
          Provider.of<downloadFileProvider>(context, listen: false).id_damage3 =
              catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
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
          Provider.of<downloadFileProvider>(context, listen: false).id_damage4 =
              catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
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
          Provider.of<downloadFileProvider>(context, listen: false).id_damage1 =
              catalogdata1[i]["Id Damage"].toString();
        });
      }
    }
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
      Provider.of<downloadFileProvider>(context, listen: false)
          .p10=uniquelist1;
             
  
    });


    return "success";
  }

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
      Provider.of<downloadFileProvider>(context, listen: false)
          .p20=uniquelist2;
          
   
    });
    return "success";
  }

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
      Provider.of<downloadFileProvider>(context, listen: false)
          .p30=uniquelist3;
          
    });

    return "success";
  }

  List<String> uniquelist4;

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
      Provider.of<downloadFileProvider>(context, listen: false)
          .p40=uniquelist4;
             
    });

    return "success";
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<downloadFileProvider>(builder: (context, value, _) {
      return Scaffold(
        body: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            IgnorePointer(
              ignoring: Provider.of<downloadFileProvider>(context, listen: false).card==true||Provider.of<downloadFileProvider>(context, listen: false).card2==true||Provider.of<downloadFileProvider>(context, listen: false).card3==true||Provider.of<downloadFileProvider>(context, listen: false).card4 ==true ?true:false ,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: <Widget>[
                            Header(
                              title: "Tyre inspection",
                            ),
                            Expanded(child: TyreInspectionBody()),
                            Fotter(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Visibility(visible:Provider.of<downloadFileProvider>(context, listen: false).card==true||Provider.of<downloadFileProvider>(context, listen: false).card2==true||Provider.of<downloadFileProvider>(context, listen: false).card3==true||Provider.of<downloadFileProvider>(context, listen: false).card4 ==true ?true:false  , child: Container(color: Color.fromARGB(192, 0, 0, 0),)),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Visibility(
                  visible: Provider.of<downloadFileProvider>(context, listen: false).card,
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.9,
                    child: Card(
                      elevation: 20,
                      child: Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(false);
                                      print(
                                          "cars1 ${Provider.of<downloadFileProvider>(context, listen: false).card}");
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked1 = false;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage1 = '---';
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage10 = '---';
                                    });
                                  },
                                  icon: Icon(Icons.close),
                                  color: Colors.red,
                                  iconSize: 30),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage1,
                                        onChanged: (val) async {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage1 = val;
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p10=['---'];
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage10 = '---';
                                            loadData1(
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .typeDamage1,
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .p10);
                                          });
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
                                        items:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p10.map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage10,
                                        onChanged: (val) {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage10 = val;

                                            // loadData2(typeDamage1, p1);
                                          });
                                          chtype1(
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage1,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage10,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .id_damage1);
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
                                              Provider.of<downloadFileProvider>(context, listen: false)
                  .commentsDamage1Controller,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)))),
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
                                        Provider.of<downloadFileProvider>(
                                                context,
                                                listen: false)
                                            .setcard(false);
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
                  visible:
                      Provider.of<downloadFileProvider>(context, listen: false)
                          .card2,
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.9,
                    child: Card(
                      elevation: 20,
                      child: Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard2(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked2 = false;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage2 = '---';
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage20 = '---';
                                    });
                                  },
                                  icon: Icon(Icons.close),
                                  color: Colors.red,
                                  iconSize: 30),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage2,
                                        onChanged: (val) async {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage2 = val;
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p20=['---'];
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage20 = '---';
                                            loadData2(
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .typeDamage2,
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .p20);
                                          });
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
                                        items:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p20
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage20,
                                        onChanged: (val) {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage20 = val;
                                            // loadData2(typeDamage1, p1);
                                          });
                                          chtype2(
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage2,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage20,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .id_damage2);
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
                                              Provider.of<downloadFileProvider>(context, listen: false)
                  .commentsDamage2Controller,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)))),
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
                                        Provider.of<downloadFileProvider>(
                                                context,
                                                listen: false)
                                            .setcard2(false);
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
                  visible:
                      Provider.of<downloadFileProvider>(context, listen: false)
                          .card3,
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.9,
                    child: Card(
                      elevation: 20,
                      child: Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard3(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked3 = false;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage3 = '---';
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage30 = '---';
                                    });
                                  },
                                  icon: Icon(Icons.close),
                                  color: Colors.red,
                                  iconSize: 30),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage3,
                                        onChanged: (val) async {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage3 = val;
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p30=['---'];
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage30 = '---';
                                            loadData3(
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .typeDamage3,
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .p30);
                                          });
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
                                        items:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p30
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage30,
                                        onChanged: (val) {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage30 = val;
                                            // loadData2(typeDamage1, p1);
                                          });
                                          chtype3(
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage3,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage30,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .id_damage3);
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
                                              Provider.of<downloadFileProvider>(context, listen: false)
                  .commentsDamage3Controller,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)))),
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
                                        Provider.of<downloadFileProvider>(
                                                context,
                                                listen: false)
                                            .setcard3(false);
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
                  visible:
                      Provider.of<downloadFileProvider>(context, listen: false)
                          .card4,
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.9,
                    child: Card(
                      elevation: 20,
                      child: Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard4(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked4 = false;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage4 = '---';
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .typeDamage40 = '---';
                                    });
                                  },
                                  icon: Icon(Icons.close),
                                  color: Colors.red,
                                  iconSize: 30),
                            ],
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage4,
                                        onChanged: (val) async {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage4 = val;
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p40=['---'];
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage40 = '---';
                                            loadData4(
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .typeDamage4,
                                                Provider.of<downloadFileProvider>(
                                                        context,
                                                        listen: false)
                                                    .p40);
                                          });
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
                                        items:
                                           Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .p40
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                        value:
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage40,
                                        onChanged: (val) {
                                          setState(() {
                                            Provider.of<downloadFileProvider>(
                                                    context,
                                                    listen: false)
                                                .typeDamage40 = val;
                                            // loadData2(typeDamage1, p1);
                                          });
                                          chtype4(
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage4,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .typeDamage40,
                                              Provider.of<downloadFileProvider>(
                                                      context,
                                                      listen: false)
                                                  .id_damage4);
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
                                              Provider.of<downloadFileProvider>(context, listen: false)
                  .commentsDamage4Controller,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)))),
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
                                        Provider.of<downloadFileProvider>(
                                                context,
                                                listen: false)
                                            .setcard4(false);
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
        )),
      );
    });
  }
}

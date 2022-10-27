import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/download_file_provider.dart';
import '../input/input_photograph.dart';
import 'container_checkbox.dart';

class TyreInspectionBody extends StatefulWidget {
  var j;
  TyreInspectionBody({Key key, this.j}) : super(key: key);

  @override
  State<TyreInspectionBody> createState() => _TyreInspectionBodyState();
}

class _TyreInspectionBodyState extends State<TyreInspectionBody> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

 

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

  @override
  void initState() {
    _dateController.text = getCurrentDate().toString();

    if (widget.j == true) {
      var data = Provider.of<downloadFileProvider>(context, listen: false)
          .inputTyreInspection;
      print("ali" + data.toString());
    }
    super.initState();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                validator: (value) => value.isEmpty ? 'Required' : null,
                keyboardType: TextInputType.number,
                controller: _hourController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerCheckbox(
                          typeDamage: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .typeDamage1,
                          typeDage10: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .typeDamage10,
                          p: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .p10,
                          controllerComments: _commentsDamage1Controller,
                          id: 1,
                          controllerRtd: _rtdOneController,
                          controllerIp: _ipOneController,
                          isChaked: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .ischaked1,
                        ),
                        ContainerCheckbox(
                          typeDamage: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .typeDamage2,
                          typeDage10: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .typeDamage20,
                          p: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .p20,
                          controllerComments: _commentsDamage2Controller,
                          id: 2,
                          card1: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .card2,
                          card2: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .card,
                          card3: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .card3,
                          card4: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .card4,
                          controllerRtd: _rtdTwoController,
                          controllerIp: _ipTwoController,
                          isChaked: Provider.of<downloadFileProvider>(context,
                                  listen: false)
                              .ischaked2,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerCheckbox(
                        typeDamage: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .typeDamage3,
                        typeDage10: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .typeDamage30,
                        p: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .p30,
                        controllerComments: _commentsDamage3Controller,
                        id: 3,
                        controllerRtd: _rtdTreeController,
                        controllerIp: _ipThreeController,
                        isChaked: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .ischaked3,
                      ),
                      ContainerCheckbox(
                        typeDamage: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .typeDamage4,
                        typeDage10: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .typeDamage40,
                        p: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .p40,
                        controllerComments: _commentsDamage4Controller,
                        id: 4,
                        controllerRtd: _rtdFourController,
                        controllerIp: _ipFourController,
                        isChaked: Provider.of<downloadFileProvider>(context,
                                listen: false)
                            .ischaked4,
                      ),
                    ],
                  ),
                )
              ],
            )),
        Container(
          width: 100,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF4A8522)),
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
                    "Type-Damage1":
                        "${Provider.of<downloadFileProvider>(context, listen: false).typeDamage1}",
                    "Type-Damage2":
                        "${Provider.of<downloadFileProvider>(context, listen: false).typeDamage2}",
                    "Type-Damage3":
                        "${Provider.of<downloadFileProvider>(context, listen: false).typeDamage3}",
                    "Type-Damage4":
                        "${Provider.of<downloadFileProvider>(context, listen: false).typeDamage3}",
                    "Comments-damage1":
                        "${Provider.of<downloadFileProvider>(context, listen: false).commentsDamage1Controller.text}",
                    "Comments-damage2":
                        "${Provider.of<downloadFileProvider>(context, listen: false).commentsDamage2Controller.text}",
                    "Comments-damage3":
                        "${Provider.of<downloadFileProvider>(context, listen: false).commentsDamage3Controller.text}",
                    "Comments-damage4":
                        "${Provider.of<downloadFileProvider>(context, listen: false).commentsDamage4Controller.text}",
                  };
                });
                print("gggggggggggggggggggggg" + tyreInspection.toString());
                Provider.of<downloadFileProvider>(context, listen: false)
                    .setInputTyreInspection(tyreInspection);
                print("vvvvvvvvvvvvv" +
                    Provider.of<downloadFileProvider>(context, listen: false)
                        .inputTyreInspection
                        .toString());

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
      ],
    );
  }
}

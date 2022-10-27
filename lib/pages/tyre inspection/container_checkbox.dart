import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/download_file_provider.dart';

class ContainerCheckbox extends StatefulWidget {
  int id;
  List p;
  var j;
  String typeDage10, typeDamage;
  TextEditingController controllerRtd, controllerIp, controllerComments;

  bool isChaked, card1, card2, card3, card4;
  ContainerCheckbox(
      {Key key,
      this.j,
      this.id,
      this.p,
      this.controllerIp,
      this.controllerRtd,
      this.card1,
      this.card2,
      this.card3,
      this.card4,
      this.isChaked,
      this.typeDamage,
      this.typeDage10,
      this.controllerComments})
      : super(key: key);

  @override
  State<ContainerCheckbox> createState() => _ContainerCheckboxState();
}

class _ContainerCheckboxState extends State<ContainerCheckbox> {
  @override
  void initState() {
    if (widget.j == true) {
      var data = Provider.of<downloadFileProvider>(context, listen: false)
          .inputTyreInspection;
      print("ali" + data.toString());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w / 2.5,
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.green[100],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      'RTD',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("^[0-9][0-9]?\$|^100\$"))
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: widget.controllerRtd,
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
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'IP',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controllerIp,
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
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: 14,
                            height: 14,
                            color: Colors.white,
                            child: Checkbox(
                              checkColor: Colors.black,
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                      color: Colors.black),
                                ),
                              ),
                              value: widget.isChaked,
                              onChanged: (bool value) {
                                setState(() {
                                  widget.isChaked = value;

                                  switch (widget.id) {
                                    case 1:
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked1 = value;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(value);

                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(value);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard2(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard3(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard4(false);

                                      break;
                                    case 2:
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked2 = value;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard2(value);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard3(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard4(false);

                                      break;
                                    case 3:
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked3 = value;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard3(value);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard2(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard4(false);
                                      break;
                                    case 4:
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .ischaked4 = value;
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard4(value);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard2(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard3(false);
                                      Provider.of<downloadFileProvider>(context,
                                              listen: false)
                                          .setcard(false);
                                      break;
                                    default:
                                      print("nothing");
                                  }
                                });
                              },
                            )),
                      )),
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Damage',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

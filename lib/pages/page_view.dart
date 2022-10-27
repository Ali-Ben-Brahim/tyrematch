import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/download_file_provider.dart';
import 'home.dart';
import 'input/input_photograph.dart';

class InnerOuter extends StatefulWidget {
  InnerOuter({Key key}) : super(key: key);

  @override
  State<InnerOuter> createState() => _InnerOuterState();
}

class _InnerOuterState extends State<InnerOuter> {
  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Map tyreInspectionDual = {};
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  var selectDamage;
  var top = Get.statusBarHeight;
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
  TextEditingController _rtdOneInnerController = TextEditingController();
  TextEditingController _rtdTwoInnerController = TextEditingController();
  TextEditingController _rtdThreeInnerController = TextEditingController();
  TextEditingController _rtdFourInnerController = TextEditingController();
  TextEditingController _ipOneInnerController = TextEditingController();
  TextEditingController _ipTwoInnerController = TextEditingController();
  TextEditingController _ipThreeInnerController = TextEditingController();
  TextEditingController _ipFourInnerController = TextEditingController();
  final TextEditingController _commentsDamage1InnerController =
      TextEditingController();
  final TextEditingController _commentsDamage2InnerController =
      TextEditingController();
  final TextEditingController _commentsDamage3InnerController =
      TextEditingController();
  final TextEditingController _commentsDamage4InnerController =
      TextEditingController();

  var typeDamage1;
  var typeDamage2;
  var typeDamage3;
  var typeDamage4;
  var typeDamage1Inner;
  var typeDamage2Inner;
  var typeDamage3Inner;
  var typeDamage4Inner;
  final TextEditingController _commentsDamage1Controller =
      TextEditingController();
  final TextEditingController _commentsDamage2Controller =
      TextEditingController();
  final TextEditingController _commentsDamage3Controller =
      TextEditingController();
  final TextEditingController _commentsDamage4Controller =
      TextEditingController();
  typedamage1() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage1,
            onChanged: (val) {
              setState(() {
                typeDamage1 = val;
              });
              print("gggggggggggggggggggggg" + typeDamage1.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage2() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage2,
            onChanged: (val) {
              setState(() {
                typeDamage2 = val;
              });
              print("gggggggggggggggggggggg" + typeDamage2.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage3() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage3,
            onChanged: (val) {
              setState(() {
                typeDamage3 = val;
              });
              print("gggggggggggggggggggggg" + typeDamage3.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage4() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage4,
            onChanged: (val) {
              setState(() {
                typeDamage4 = val;
              });
              print("gggggggggggggggggggggg" + typeDamage4.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage1Inner() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage1Inner,
            onChanged: (val) {
              setState(() {
                typeDamage1Inner = val;
              });
              print("gggggggggggggggggggggg" + typeDamage1Inner.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage2Inner() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage2Inner,
            onChanged: (val) {
              setState(() {
                typeDamage2Inner = val;
              });
              print("gggggggggggggggggggggg" + typeDamage2Inner.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage3Inner() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage3Inner,
            onChanged: (val) {
              setState(() {
                typeDamage3Inner = val;
              });
              print("gggggggggggggggggggggg" + typeDamage3Inner.toString());
            },
          ),
        )
      ],
    );
  }

  typedamage4Inner() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Type',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField(
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
            items: ['Damage 1', 'Damage 2', "Damage 3"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: typeDamage4Inner,
            onChanged: (val) {
              setState(() {
                typeDamage4Inner = val;
              });
              print("gggggggggggggggggggggg" + typeDamage4Inner.toString());
            },
          ),
        )
      ],
    );
  }

  Future<void> _showDamage(Widget row, TextEditingController comments) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Damage description'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                row,
                SizedBox(
                  height: 10,
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Comments',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: comments,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)))),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF4A8522)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Save",
                    style: TextStyle(fontWeight: FontWeight.w700))),
          ],
        );
      },
    );
  }

  Widget checkbox() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool value) {
        setState(() {
          isChecked = value;
          if (isChecked == true) {
            _showDamage(typedamage1(), _commentsDamage1Controller);
          }
        });
      },
    );
  }

  Widget checkbox2() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked2,
      onChanged: (bool value) {
        setState(() {
          isChecked2 = value;
          if (isChecked2 == true) {
            _showDamage(typedamage2(), _commentsDamage2Controller);
          }
        });
      },
    );
  }

  Widget checkbox3() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked3,
      onChanged: (bool value) {
        setState(() {
          isChecked3 = value;
          if (isChecked3 == true) {
            _showDamage(typedamage3(), _commentsDamage3Controller);
          }
        });
      },
    );
  }

  Widget checkbox4() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked4,
      onChanged: (bool value) {
        setState(() {
          isChecked4 = value;
          if (isChecked4 == true) {
            _showDamage(typedamage4(), _commentsDamage4Controller);
          }
        });
      },
    );
  }

  Widget checkboxInner() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked5,
      onChanged: (bool value) {
        setState(() {
          isChecked5 = value;
          if (isChecked5 == true) {
            _showDamage(typedamage1Inner(), _commentsDamage1InnerController);
          }
        });
      },
    );
  }

  Widget checkbox2Inner() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked6,
      onChanged: (bool value) {
        setState(() {
          isChecked6 = value;
          if (isChecked6 == true) {
            _showDamage(typedamage2Inner(), _commentsDamage2InnerController);
          }
        });
      },
    );
  }

  Widget checkbox3Inner() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked7,
      onChanged: (bool value) {
        setState(() {
          isChecked7 = value;
          if (isChecked7 == true) {
            _showDamage(typedamage3Inner(), _commentsDamage3InnerController);
          }
        });
      },
    );
  }

  Widget checkbox4Inner() {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked8,
      onChanged: (bool value) {
        setState(() {
          isChecked8 = value;
          if (isChecked8 == true) {
            _showDamage(typedamage4Inner(), _commentsDamage4InnerController);
          }
        });
      },
    );
  }

  gridTyre(TextEditingController controller1, TextEditingController controller2,
      Widget check) {
    return Container(
      height: 120,
      color: Colors.grey,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'RTD',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Form(
                      child: TextFormField(
                        controller: controller1,
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
                      ),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'IP',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Form(
                      child: TextFormField(
                        controller: controller2,
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
                      ),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(flex: 1, child: check),
                const Flexible(
                  flex: 3,
                  child: Text(
                    'Damage',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h6 = MediaQuery.of(context).size.height * 0.06;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: page,
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: top / 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Home(color: false),
                        ),
                      );
                    },
                    child: Center(
                      child: SizedBox(
                          width: w * 0.9,
                          child: Provider.of<downloadFileProvider>(context,
                                          listen: false)
                                      .status ==
                                  "false"
                              ? Image.asset("assets/images/basic.png")
                              : Image.asset("assets/images/advanced.png")),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: const Color.fromARGB(255, 127, 127, 127),
                    child: Center(
                      child: Text(
                        "Tyre inspection",
                        style: TextStyle(
                            fontSize: h6 / 2,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            'Date',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextFormField(
                              onTap: () async {
                                DateTime newDate = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (newDate != null) {
                                  setState(() {
                                    _dateController.text =
                                        DateFormat("yyyy-MM-dd")
                                            .format(newDate);
                                  });
                                }
                              },
                              controller: _dateController,
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
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            'Hours',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Form(
                              child: TextFormField(
                                controller: _hourController,
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
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: const Color(0xFF4A8522),
                      child: Center(
                        child: Text(
                          "INNER  TYRE",
                          style: TextStyle(
                              fontSize: h6 / 2,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: h / 2.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/tractorone.png"),
                            fit: BoxFit.contain),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: gridTyre(_rtdOneInnerController,
                                      _ipOneInnerController, checkboxInner()),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: gridTyre(_rtdTwoInnerController,
                                      _ipTwoInnerController, checkbox2Inner()),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: gridTyre(
                                      _rtdThreeInnerController,
                                      _ipThreeInnerController,
                                      checkbox3Inner()),
                                ),
                                SizedBox(
                                    width: 120,
                                    child: gridTyre(
                                        _rtdFourInnerController,
                                        _ipFourInnerController,
                                        checkbox4Inner())),
                              ],
                            ),
                          )
                        ],
                      )),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF4A8522)),
                          ),
                          onPressed: () {
                            page.animateToPage(++pageIndex,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linearToEaseOut);
                          },
                          child: const Text("Next",
                              style: TextStyle(fontWeight: FontWeight.w700))),
                      SizedBox(
                          width: 150,
                          child:
                              Image.asset("assets/images/Bridgestone-Logo.png"))
                    ],
                  )
                ]),
          ),

          /////////////////////////////////////////////////////////////////////////////////////
          SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: top / 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Home(color: false),
                        ),
                      );
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Provider.of<downloadFileProvider>(context,
                                        listen: false)
                                    .status ==
                                "false"
                            ? Image.asset("assets/images/basic.png")
                            : Image.asset("assets/images/advanced.png")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: const Color.fromARGB(255, 127, 127, 127),
                    child: Center(
                      child: Text(
                        "Tyre inspection",
                        style: TextStyle(
                            fontSize: h6 / 2,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: const Color(0xFF4A8522),
                      child: Center(
                        child: Text(
                          "OUTER  TYRE",
                          style: TextStyle(
                              fontSize: h6 / 2,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                        height: h / 2.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/tractortwo.png"),
                              fit: BoxFit.contain),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: gridTyre(_rtdOneController,
                                        _ipOneController, checkbox()),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: gridTyre(_rtdTwoController,
                                        _ipTwoController, checkbox2()),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: gridTyre(_rtdTreeController,
                                        _ipThreeController, checkbox3()),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: gridTyre(_rtdFourController,
                                          _ipFourController, checkbox4())),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF4A8522)),
                          ),
                          onPressed: () {
                            setState(() {
                              tyreInspectionDual = {
                                "date": "${_dateController.text}",
                                "hours": "${_hourController.text}",
                                "RTD1Inner": "${_rtdOneInnerController.text}",
                                "RTD2Inner": "${_rtdTwoInnerController.text}",
                                "RTD3Inner": "${_rtdThreeInnerController.text}",
                                "RTD4Inner": "${_rtdFourInnerController.text}",
                                "RTD1Outer": "${_rtdOneController.text}",
                                "RTD2Outer": "${_rtdTwoController.text}",
                                "RTD3Outer": "${_rtdTreeController.text}",
                                "RTD4Outer": "${_rtdFourController.text}",
                                "IP1Inner": "${_ipOneInnerController.text}",
                                "IP2Inner": "${_ipTwoInnerController.text}",
                                "IP3Inner": "${_ipThreeInnerController.text}",
                                "IP4Inner": "${_ipFourInnerController.text}",
                                "Ip1Outer": "${_ipOneController.text}",
                                "IP2Outer": "${_ipTwoController.text}",
                                "IP3Outer": "${_ipThreeController.text}",
                                "IP4Outer": "${_ipFourController.text}",
                                "Type-Damage1Inner": "$typeDamage1Inner",
                                "Type-Damage2Inner": "$typeDamage2Inner",
                                "Type-Damage3Inner": "$typeDamage3Inner",
                                "Type-Damage4Inner": "$typeDamage4Inner",
                                "Type-Damage1Outer": "$typeDamage1",
                                "Type-Damage2Outer": "$typeDamage2",
                                "Type-Damage3Outer": "$typeDamage3",
                                "Type-Damage4Outer": "$typeDamage4",
                                "Comments-damage1Inner":
                                    "${_commentsDamage1InnerController.text}",
                                "Comments-damage2Inner":
                                    "${_commentsDamage2InnerController.text}",
                                "Comments-damage3Inner":
                                    "${_commentsDamage3InnerController.text}",
                                "Comments-damage4Inner":
                                    "${_commentsDamage4InnerController.text}",
                                "Comments-damage1Outer":
                                    "${_commentsDamage1Controller.text}",
                                "Comments-damage2Outer":
                                    "${_commentsDamage2Controller.text}",
                                "Comments-damage3Outer":
                                    "${_commentsDamage3Controller.text}",
                                "Comments-damage4Outer":
                                    "${_commentsDamage4Controller.text}",
                              };
                            });
                            Provider.of<downloadFileProvider>(context,
                                    listen: false)
                                .setInputTyreInspection(tyreInspectionDual);
                            print("tyreInspectionDual $tyreInspectionDual");
                            var st = 1;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => InputPhotographs(
                                      st: st,
                                    )));
                          },
                          child: const Text("Save",
                              style: TextStyle(fontWeight: FontWeight.w700))),
                      SizedBox(
                          width: 150,
                          child:
                              Image.asset("assets/images/Bridgestone-Logo.png"))
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

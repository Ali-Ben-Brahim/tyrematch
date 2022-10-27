import 'input_test3.dart';
import 'input_test4.dart';
import 'succes_page.dart';
import 'input_test.dart';
import 'package:flutter/material.dart';
import 'input_test2.dart';

class Inputmain extends StatefulWidget {
  const Inputmain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<Inputmain> createState() => _InputmainState();
}

class _InputmainState extends State<Inputmain> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ExpansionTile(
                  maintainState: true,
                  title: const Text("Tyre 1"),
                  children: [
                    InputTyr(formKey: _formKey),
                  ],
                ),
                ExpansionTile(
                  maintainState: true,
                  title: const Text("Tyre 2"),
                  children: [
                    InputTyr2(formKey: _formKey2),
                  ],
                ),
                ExpansionTile(
                  maintainState: true,
                  title: const Text("Tyre 3"),
                  children: [
                    InputTyr3(formKey: _formKey3),
                  ],
                ),
                ExpansionTile(
                  maintainState: true,
                  title: const Text("Tyre 4"),
                  children: [
                    InputTyr4(formKey: _formKey4),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                              side: const BorderSide(
                                  width: 1, color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16))),
                  onPressed: () {
                    if (_formKey.currentState.validate() ||
                        _formKey2.currentState.validate() ||
                        _formKey3.currentState.validate() ||
                        _formKey4.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sucess()));
                    }
                  },
                  child: const Text(
                    "Modify",
                    style: TextStyle(color: Color.fromRGBO(75, 174, 79, 1)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

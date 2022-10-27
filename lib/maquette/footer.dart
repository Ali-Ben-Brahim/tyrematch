import 'package:flutter/material.dart';

class Fotter extends StatefulWidget {
  Fotter({Key key}) : super(key: key);

  @override
  State<Fotter> createState() => _FotterState();
}

class _FotterState extends State<Fotter> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/Bridgestone-Logo.png",
                          width: 200,
                        ),
                      );
  }
}
import 'package:flutter/cupertino.dart';

class ReadCalculation extends StatefulWidget {
  var file;
  ReadCalculation({Key key, this.file}) : super(key: key);

  @override
  State<ReadCalculation> createState() => _ReadCalculationState();
}

class _ReadCalculationState extends State<ReadCalculation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${widget.file}"),
    );
  }
}

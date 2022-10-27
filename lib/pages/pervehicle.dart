import 'package:flutter/material.dart';

import '../maquette/footer.dart';
import '../maquette/header_card.dart';
import '../maquette/body.dart';


class TyreInspection extends StatefulWidget {
   var calculation;
  var details;
  var date;
  var rsize;
  var fsize;
  var data;
  TyreInspection(      {Key key, this.details, this.date, this.fsize, this.rsize, this.data})
 : super(key: key);

  @override
  State<TyreInspection> createState() => _TyreInspectionState();
}

class _TyreInspectionState extends State<TyreInspection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    HeaderCard(title: "Vehicle data",data: widget.data,date: widget.date,details: widget.details,fsize: widget.fsize,rsize: widget.rsize),
                    Expanded(child: Body(details: widget.details,)),
                    Fotter(),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}

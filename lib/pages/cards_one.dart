import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardsOne extends StatefulWidget {
  CardsOne({
    Key key,
    this.image,
    this.title,
    this.green,
    this.white,
    this.imagewhite,
    this.text,
  }) : super(key: key);
  String image;
  String title;
  Color green;
  Color white;
  String imagewhite;
  Color text;
  @override
  State<CardsOne> createState() => _CardsOneState();
}

class _CardsOneState extends State<CardsOne> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: widget.green,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: widget.white,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Container(
                  width: 50,
                  child: Image.asset(
                      'assets/images/${widget.image}${widget.imagewhite}.png'))),
          Flexible(
            child: Text(
              "${widget.title}",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.text),
            ),
          ),
        ],
      ),
    );
  }
}

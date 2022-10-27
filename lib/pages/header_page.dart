import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/download_file_provider.dart';
import 'home.dart';

class Header extends StatefulWidget {
  Header({Key key, this.title}) : super(key: key);
  String title;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
    
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>  Home(color: false),
    ),
  );
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.9 , child: Provider.of<downloadFileProvider>(context, listen: false).status == "false"? Image.asset("assets/images/basic.png"):Image.asset("assets/images/advanced.png")),
                  ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.04,
            color: const Color.fromARGB(255, 127, 127, 127),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

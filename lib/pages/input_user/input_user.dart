import 'package:flutter/material.dart';

import '../../maquette/footer.dart';
import '../../maquette/header.dart';
import 'input_user_body.dart';




class InputUser extends StatefulWidget {

  InputUser(      {Key key})
 : super(key: key);

  @override
  State<InputUser> createState() => _InputUserState();
}

class _InputUserState extends State<InputUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Header(title: "My profile",),
                    Expanded(child: InputUserBody()),
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

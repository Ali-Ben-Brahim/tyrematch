import 'package:flutter/material.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter_blue_app/provider/download_file_provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

import '../SelectBondedDevicePage.dart';

class Bluetoothpage extends StatefulWidget {
  var color;
  var n1;
  Bluetoothpage({Key key, this.n1
      /*this.color*/
      })
      : super(key: key);

  @override
  State<Bluetoothpage> createState() => _BluetoothpageState();
}

class _BluetoothpageState extends State<Bluetoothpage> {
  @override
  var c;

  // gg() async {
  //   await Provider.of<downloadFileProvider>(context, listen: false)
  //       .getStringValuesSF();
  // }

  void initState() {
    widget.color =
        Provider.of<downloadFileProvider>(context, listen: false).status;
    print("7777777777777777777777777777777777777777777777" +
        widget.color.toString());
    if (widget.color.toString() == "true") {
      c = Colors.red;
    } else {
      c = Colors.blue.shade900;
    }
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    super.initState();

    // gg();
  }

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: _bluetoothState.isEnabled == false
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceEvenly,
          children: [
            _bluetoothState.isEnabled == false
                ? SizedBox(
                    child: Text("Tape to activate bluetooth"),
                  )
                : SizedBox(
                    width: 1,
                  ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: RippleAnimation(
                repeat: true,
                color: c,
                minRadius: 50,
                ripplesCount: 8,
                child: Center(
                    child: InkWell(
                        onTap: () async {
                          _bluetoothState.isEnabled == false
                              ? await FlutterBluetoothSerial.instance
                                  .requestEnable()
                              : await FlutterBluetoothSerial.instance
                                  .requestDisable();
                        },
                        child: Image.asset("assets/images/bluetooth.png"))),
              ),
            ),
            _bluetoothState.isEnabled == true
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    child: SelectBondedDevicePage(
                      checkAvailability: false,
                      color: c,
                      c2: widget.color,
                    ))
                : SizedBox(
                    width: 1,
                  )
          ],
        ),
      ),
    ));
  }
}

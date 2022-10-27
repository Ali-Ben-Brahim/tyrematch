import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Communication {
  //Bluetooth
  FlutterBluetoothSerial fls;
  BluetoothConnection connection;
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  String result = '';

  // Connect to the device via Bluetooth
  Future<void> connectBl(address) async {
    try {
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(address);
      print('Connected to the device');

      connection.input.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        connection.output.add(data); // Sending data

        if (ascii.decode(data).contains('!')) {
          connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    } catch (exception) {
      print('Cannot connect, exception occured');
    }
  }

  // When receive information
  void onDataReceived(Uint8List data) {
    try {
      print("lllllllllllllllllllllllllllllllllll$data");
      // Allocate buffer for parsed data
      int backspacesCounter = 0;
      data.forEach((byte) {
        if (byte == 8 || byte == 127) {
          backspacesCounter++;
        }
      });
      Uint8List buffer = Uint8List(data.length - backspacesCounter);
      int bufferIndex = buffer.length;

      // Apply backspace control character
      backspacesCounter = 0;
      for (int i = data.length - 1; i >= 0; i--) {
        if (data[i] == 8 || data[i] == 127) {
          backspacesCounter++;
        } else {
          if (backspacesCounter > 0) {
            backspacesCounter--;
          } else {
            buffer[--bufferIndex] = data[i];
          }
        }
      }

      result = String.fromCharCodes(buffer);
    } catch (_) {}

    // Create message if there is new line character
  }

  // To send Message
  Future<void> sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;
      } catch (e) {}
    }
  }

  Future<void> dispose() async {
    fls.setPairingRequestHandler(null);
    if (connection.isConnected) {
      connection.dispose();
      connection = null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/input_user/input_user.dart';

import 'package:flutter_blue_app/pages/login.dart';
import 'package:flutter/services.dart';

import 'package:flutter_blue_app/provider/download_file_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:video_player/video_player.dart';
import 'dart:async';

import 'MainPage.dart';
import 'pages/test.dart';
import 'pages/tyre inspection/container_checkbox.dart';
import 'pages/tyre inspection/tyre_inspection.dart';

bool islogin = false;
const primaryColor = Color.fromARGB(255, 0, 0, 0);
//Wakelock.enable();
void main() {
  TextEditingController _rtdOneController = TextEditingController();
TextEditingController _rtdTwoController = TextEditingController();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => downloadFileProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "splash screen",

          home: FirstActivity(),
          //  home: Test(),

          //    home: InputPhotographs(),
          theme: ThemeData(
            primaryColor: primaryColor,
          ),
          //   home: InputInspection(),
        )),
  );
}

class FirstActivity extends StatefulWidget {
  FirstActivity({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstActivityState();
}

class _FirstActivityState extends State<FirstActivity> {
  VideoPlayerController _controller;
  bool _visible = false;
  var timer;
  @override
  void initState() {
    clearShare();
    print("Shared clear");
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/images/Bridgestone.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      timer = Timer(Duration(milliseconds: 500), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Login()), (_) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 5000),
      child: VideoPlayer(_controller),
    );
  }

  clearShare() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _getVideoBackground(),
        height: 200,
        margin: EdgeInsets.only(top: 120),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
    );
  }
}

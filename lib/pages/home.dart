import 'package:flutter/services.dart';
import 'package:flutter_blue_app/pages/cards_one.dart';
import 'package:flutter_blue_app/pages/input/input_user.dart';
import 'package:flutter_blue_app/pages/read/read_folders.dart';
import 'package:flutter_blue_app/pages/search_vehicle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/download_file_provider.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {
  Home({Key key, this.color}) : super(key: key);
  var color;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    ishover = false;
    ishover2 = false;
    ishover3 = false;
    ishover4 = false;
    ishover5 = false;
    ishover6 = false;
    super.initState();
  }

  bool ishover = false;
  bool ishover2 = false;
  bool ishover3 = false;
  bool ishover4 = false;
  bool ishover5 = false;
  bool ishover6 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;
    return Scaffold(
        body: SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: Provider.of<downloadFileProvider>(context, listen: false)
                            .status ==
                        "false"
                    ? Image.asset("assets/images/basic.png")
                    : Image.asset("assets/images/advanced.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                color: const Color.fromARGB(255, 127, 127, 127),
                child: Center(
                  child: Text(
                    "Main menu",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            child: GridView.count(
          childAspectRatio: (itemWidth / itemHeight),
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            InkWell(
                onLongPress: () async {
                  SharedPreferences prefs4 =
                      await SharedPreferences.getInstance();
                  var usr = prefs4.getString("fname");
                  if (usr == null || usr.isEmpty) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => InputUser()));
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchVehicle()));
                  }

                  Provider.of<downloadFileProvider>(context, listen: false)
                      .settypehome("wifi");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => InputUser()));
                },
                onTap: () async {
                  setState(() {
                    ishover = !ishover;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Provider.of<downloadFileProvider>(context, listen: false)
                        .settypehome("wifi");
                    SharedPreferences prefs4 =
                        await SharedPreferences.getInstance();
                    var usr = prefs4.getString("fname");
                    // if (usr == null || usr.isEmpty) {
                    //   Navigator.of(context).push(
                    //       MaterialPageRoute(builder: (_) => InputUser()));
                    //   setState(() {
                    //     ishover = false;
                    //   });
                    // } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchVehicle()));
                    // }
                    setState(() {
                      ishover = false;
                    });
                  });
                },
                child: ishover == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "wifi",
                        title: 'Tyrematch\nanalysis',
                      )
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "wifi",
                        title: 'Tyrematch\nanalyse')),
            InkWell(
                onLongPress: () async {
                  setState(() {
                    ishover2 = !ishover2;
                  });
                  SharedPreferences prefs4 =
                      await SharedPreferences.getInstance();
                  var usr = prefs4.getString("fname");
                  if (usr == null || usr.isEmpty) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => InputUser()));
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => InputUser()));
                  }

                  Provider.of<downloadFileProvider>(context, listen: false)
                      .settypehome("search");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => InputUser()));
                },
                onTap: () async {
                  setState(() {
                    ishover2 = !ishover2;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Provider.of<downloadFileProvider>(context, listen: false)
                        .settypehome("search");
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => InputUser()));

                    SharedPreferences prefs4 =
                        await SharedPreferences.getInstance();
                    var usr = prefs4.getString("fname");
                    //     if (usr == null || usr.isEmpty) {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => InputUser()));

                    setState(() {
                      ishover2 = false;
                    });
                    //  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchVehicle()));
                    // setState(() {
                    //   ishover2 = false;
                    // });
                    //  }
                  });
                },
                child: ishover2 == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "search",
                        title: 'Tyre\ninspection')
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "search",
                        title: 'Tyre\ninspection')),
            InkWell(
                onLongPress: () {
                  setState(() {
                    ishover3 = !ishover3;
                  });
                  Provider.of<downloadFileProvider>(context, listen: false)
                      .settypehome("tractor");

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchVehicle()));
                },
                onTap: () {
                  setState(() {
                    ishover3 = !ishover3;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Provider.of<downloadFileProvider>(context, listen: false)
                        .settypehome("tractor");

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchVehicle()));
                    setState(() {
                      ishover3 = false;
                    });
                  });
                },
                child: ishover3 == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "tractor",
                        title: 'Vehicles')
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "tractor",
                        title: 'Vehicles')),
            InkWell(
                onLongPress: () {
                  setState(() {
                    ishover4 = !ishover4;
                  });
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ReadFolders()));
                },
                onTap: () {
                  setState(() {
                    ishover4 = !ishover4;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => ReadFolders()));
                    setState(() {
                      ishover4 = false;
                    });
                  });
                },
                child: ishover4 == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "file",
                        title: 'Share data')
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "file",
                        title: 'Share data')),
            InkWell(
                onLongPress: () {
                  setState(() {
                    ishover5 = !ishover5;
                  });
                },
                onTap: () {
                  setState(() {
                    ishover5 = !ishover5;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => InputUser(
                              color: "1",
                            )));
                    setState(() {
                      ishover5 = false;
                    });
                  });
                },
                child: ishover5 == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "profile",
                        title: 'My profile')
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "profile",
                        title: 'My profile')),
            InkWell(
                onLongPress: () {
                  setState(() {
                    ishover6 = !ishover6;
                  });
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login(),
                    ),
                  );
                },
                onTap: () {
                  setState(() {
                    ishover6 = !ishover6;
                  });
                  new Future.delayed(const Duration(milliseconds: 200),
                      () async {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Login(),
                      ),
                    );
                    setState(() {
                      ishover6 = false;
                    });
                  });
                },
                child: ishover6 == false
                    ? CardsOne(
                        green: Color(0xFFFFFFFF),
                        white: Color(0xFF4A8522),
                        text: Color(0xFF000000),
                        imagewhite: "",
                        image: "logout",
                        title: 'Log out')
                    : CardsOne(
                        green: Color(0xFF4A8522),
                        white: Color(0xFFFFFFFF),
                        text: Color(0xFFFFFFFF),
                        imagewhite: "white",
                        image: "logout",
                        title: 'Log out')),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Bridgestone-Logo.png",
            width: 200,
          ),
        )
      ]),
    ));
  }
}

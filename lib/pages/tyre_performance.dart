import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/download_file_provider.dart';
import 'home.dart';

class TyrePerformance extends StatefulWidget {
  TyrePerformance({Key key}) : super(key: key);

  @override
  State<TyrePerformance> createState() => _TyrePerformanceState();
}

class _TyrePerformanceState extends State<TyrePerformance> {
  final TextEditingController _commentsController = TextEditingController();
  File image;
  final imagepicker = ImagePicker();
  double ratingTraction = 0;
  double ratingRoadComfort = 0;
  double ratingVibration = 0;
  double ratingSoilCare = 0;

  uploadImage() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    } else {}
  }

  Map _inputVehicle = {};

  Future<void> _check() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to make a Tyrematch analyse ?',
              textAlign: TextAlign.center),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A8522)),
                      ),
                      onPressed: () {
                        setState(() {
                          _inputVehicle = {
                            "Traction": ratingTraction.toString(),
                            "Road comfort": ratingRoadComfort.toString(),
                            "Vibration": ratingVibration.toString(),
                            "Soil care": ratingSoilCare.toString(),
                            "Comments": _commentsController.text,
                          };
                        });

                        Navigator.of(context).pop();
                      },
                      child: const Text("Yes",
                          style: TextStyle(fontWeight: FontWeight.w700))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A8522)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("No",
                          style: TextStyle(fontWeight: FontWeight.w700))),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var top = Get.statusBarHeight;
    double h6 = MediaQuery.of(context).size.height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: top / 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Home(color: false),
                        ),
                      );
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Provider.of<downloadFileProvider>(context,
                                        listen: false)
                                    .status ==
                                "false"
                            ? Image.asset("assets/images/basic.png")
                            : Image.asset("assets/images/advanced.png")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: const Color.fromARGB(255, 127, 127, 127),
                    child: Text(
                      "Tyre performance",
                      style: TextStyle(
                          fontSize: h6 / 2,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const Flexible(
                    //         flex: 1,
                    //         child: Text(
                    //           'Traction',
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //       Flexible(
                    //           flex: 2,
                    //           child: Container(
                    //             child: RatingBar.builder(
                    //                 updateOnDrag: true,
                    //                 minRating: 1,
                    //                 itemBuilder: (context, _) => const Icon(
                    //                       Icons.star,
                    //                       color: Color(0xFF4A8522),
                    //                     ),
                    //                 onRatingUpdate: (rating) {
                    //                   ratingTraction = rating;
                    //                 }),
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const Flexible(
                    //         flex: 1,
                    //         child: Text(
                    //           'Road comfort',
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //       Flexible(
                    //           flex: 2,
                    //           child: Container(
                    //             child: RatingBar.builder(
                    //                 updateOnDrag: true,
                    //                 minRating: 1,
                    //                 itemBuilder: (context, _) => const Icon(
                    //                       Icons.star,
                    //                       color: Color(0xFF4A8522),
                    //                     ),
                    //                 onRatingUpdate: (rating) {
                    //                   setState(() {
                    //                     ratingRoadComfort = rating;
                    //                   });
                    //                 }),
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const Flexible(
                    //         flex: 1,
                    //         child: Text(
                    //           'Vibration',
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //       Flexible(
                    //           flex: 2,
                    //           child: Container(
                    //             child: RatingBar.builder(
                    //                 updateOnDrag: true,
                    //                 minRating: 1,
                    //                 itemBuilder: (context, _) => const Icon(
                    //                       Icons.star,
                    //                       color: const Color(0xFF4A8522),
                    //                     ),
                    //                 onRatingUpdate: (rating) {
                    //                   setState(() {
                    //                     ratingVibration = rating;
                    //                   });
                    //                 }),
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const Flexible(
                    //         flex: 1,
                    //         child: Text(
                    //           'Soil care',
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //       Flexible(
                    //           flex: 2,
                    //           child: Container(
                    //             child: RatingBar.builder(
                    //                 updateOnDrag: true,
                    //                 minRating: 1,
                    //                 itemBuilder: (context, _) => const Icon(
                    //                       Icons.star,
                    //                       color: Color(0xFF4A8522),
                    //                     ),
                    //                 onRatingUpdate: (rating) {
                    //                   ratingSoilCare = rating;
                    //                 }),
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 42, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Add inspection picture',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            onTap: uploadImage,
                            child: const CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                      "assets/images/photo-camera.png"),
                                  backgroundColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Flexible(
                              flex: 1,
                              child: Text(
                                'Comments',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                  child: TextFormField(
                                      controller: _commentsController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 2,
                                      decoration: const InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black))))))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A8522)),
                      ),
                      onPressed: () {
                        _check();
                      },
                      child: const Text("Save",
                          style: const TextStyle(fontWeight: FontWeight.w700))),
                  Container(
                      width: 150,
                      child: Image.asset("assets/images/Bridgestone-Logo.png"))
                ],
              )
            ]),
      ),
    );
  }
}

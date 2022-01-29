import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/third_party_navigation/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // "unofficial-summary": [
  //     {
  //       "source": "covid19india.org",
  //       "total": 7945975,
  //       "recovered": 7198877,
  //       "deaths": 119538,
  //       "active": 626192
  //     }
  //   ],

  final String jsonString =
      '{"unofficial-summary": [{"source": "covid19india.org","total": 7945975,"recovered": 7198877,"deaths": 119538,"active": 626192}]}';
  var jsonObject = {};

  @override
  void initState() {
    super.initState();

    jsonObject = jsonDecode(jsonString);

    debugPrint("RESPONSE $jsonObject");
    debugPrint("DEATHS : ${jsonObject['unofficial-summary'][0]['deaths']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.red,
            //     ),
            //     child: const Padding(
            //       padding: EdgeInsets.all(16.0),
            //       child: FlutterLogo(
            //         size: 120,
            //       ),
            //     ),
            //   ),
            // ),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.amber,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1244533261109317632/3lQ0Ok3t_400x400.jpg"),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.network(
                  "https://pbs.twimg.com/profile_images/1244533261109317632/3lQ0Ok3t_400x400.jpg",
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: "Write your first name",
                label: Text("First Name"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: "Write your last name",
                label: Text("Last Name"),
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      String _firstName = _firstNameController.text;
                      String _lastName = _lastNameController.text;

                      debugPrint("OUR First NAME: $_firstName");
                      debugPrint("OUR Last NAME: $_lastName");

                      // Fluttertoast.showToast(
                      //   msg: "Entered name is $firstName $lastName",
                      // );

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Entered name is $firstName $lastName"),
                      //   ),
                      // );

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SecondScreen(
                            firstName: _firstName,
                            lastName: _lastName,
                            counter: 100,
                            imgURL:
                                'https://effigis.com/wp-content/uploads/2015/02/DigitalGlobe_WorldView2_50cm_8bit_Pansharpened_RGB_DRA_Rome_Italy_2009DEC10_8bits_sub_r_1.jpg',
                          );
                        },
                      ));
                    },
                    child: const Text("Submit")))
          ],
        ),
      ),
    );
  }
}

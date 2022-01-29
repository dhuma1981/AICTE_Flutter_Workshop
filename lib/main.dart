import 'package:flutter/material.dart';
import 'package:flutter_application_demo_1/api_demo_mobx/api_demo.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: MyHomePage(),
      //home: FirstScreen(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DataStore(),
      //   builder: (context, child) => const APIDemo(),
      // ),
      // home: APIDemo(),
      home: APIDemoMobx(),
    );
  }
}

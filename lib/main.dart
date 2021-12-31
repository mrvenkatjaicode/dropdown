import 'package:flutter/material.dart';
import 'package:multilevel_dropdown_flutter/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Level Dropdown',
      debugShowCheckedModeBanner: false,
      home: DropDown(),
    );
  }
}

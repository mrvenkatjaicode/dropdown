import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:multilevel_dropdown_flutter/model/carmodel.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    var dio = Dio();
    final response = await dio.get(
        'https://raw.githubusercontent.com/mrvenkatjaicode/Image/main/Whatsapp/detail.json');
    var result = jsonDecode(response.data);
    print(result['cars']);
    List dat = result['cars']['Nissan'];
    List i = dat.map((e) => Nissan.fromJson(e).model).toList();
    List datt = result['cars']['Ford'];
    List ii = datt.map((e) => Ford.fromJson(e).model).toList();
    // List<Nissan> nisson = result['cars'];
    print(i);
    print(ii);
    setState(() {
      nissan = i;
      ford = ii;
      print(nissan);
      print(ford);
    });
  }

  List<String> cars = ['Nissan', 'Ford'];
  List<String> nissan = [];
  List<String> ford = [];

  List<String> model = [];
  String selectedCar;
  String selectedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Multi Level Dropdown'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // Country Dropdown
          DropdownButton<String>(
            hint: Text('Cars'),
            value: selectedCar,
            isExpanded: true,
            items: cars.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (car) {
              if (car == 'Ford') {
                model = ford;
              } else if (car == 'Nissan') {
                model = nissan;
              } else {
                model = [];
              }
              setState(() {
                selectedModel = null;
                selectedCar = car;
              });
            },
          ),
          // Country Dropdown Ends here
          SizedBox(height: 60.0),
          // Province Dropdown
          DropdownButton<String>(
            hint: Text('Models'),
            value: selectedModel,
            isExpanded: true,
            items: model.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (model) {
              setState(() {
                selectedModel = model;
              });
            },
          ),
          // Province Dropdown Ends here
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'DropdKonversi.dart';
import 'Riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _miligram = 0;
  double _kilogram = 0;
  double _gram = 0; //inisialisasi
  double _ons = 0;
  final inputController = TextEditingController(); //memanggil nilai variabel
  String _newValue = "Kilogram";
  double _result = 0;

  List<String> listViewItem = List<String>();
  var listItem = ["Kilogram", "Gram", "Ons", "Miligram"];

  void perhitunganMassa() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kilogram")
        _result = _inputUser / 1000 ;
      else if (_newValue == "Gram")
        _result = _inputUser * 3;
      else if (_newValue == "Ons")
        _result = _inputUser / 28.35 ;
      else 
        _result = (_inputUser * 1000);
    });
    listViewItem.add("$_newValue : $_result");
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganMassa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Massa"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  dropdownKonversi(
                      listItem: listItem,
                      newValue: _newValue,
                      dropdownOnChanged: dropdownOnChanged),
                  Input(inputUserController: inputController),
                  dropdownKonversi(
                      listItem: listItem,
                      newValue: _newValue,
                      dropdownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(konvertHandler: perhitunganMassa),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "History Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

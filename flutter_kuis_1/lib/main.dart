import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'DropdKonversi.dart';
import 'DropdKonversiTo.dart';
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
  String _newValueTo = "Kilogram";
  String _newValue = "Kilogram";
  double _result = 0;

  List<String> listViewItem = List<String>(); //menampilkan list yg bawah. 
  List<String> listMassa = List <String>();
  List<String> listTo = ["Kilogram", "Gram","Ons","Miligram"]; 

  var listItem = ["Kilogram", "Gram", "Ons", "Miligram"];

  void perhitunganMassa() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kilogram" && _newValueTo == "Kilogram")
        _result = _inputUser * 1 ;
      else if (_newValue == "Kilogram" && _newValueTo == "Gram")
        _result = _inputUser * 1000;
      else if (_newValue == "Kilogram" && _newValueTo == "Ons")
        _result = _inputUser * 10;
      else if (_newValue == "Kilogram" && _newValueTo == "Miligram")
        _result = _inputUser * 1000000;
      else if (_newValue == "Gram" && _newValueTo == "Gram")
        _result = _inputUser * 1;
      else if (_newValue == "Gram" && _newValueTo == "Kilogram")
        _result = _inputUser / 1000;
      else if (_newValue == "Gram" && _newValueTo == "Ons")
        _result = _inputUser / 100;
      else if (_newValue == "Gram" && _newValueTo == "Miligram")
        _result = _inputUser * 1000;
      else if (_newValue == "Ons" && _newValueTo == "Ons")
        _result = _inputUser * 1;
      else if (_newValue == "Ons" && _newValueTo == "Kilogram")
        _result = _inputUser / 10;
      else if (_newValue == "Ons" && _newValueTo == "Gram")
        _result = _inputUser * 100;
      else if (_newValue == "Ons" && _newValueTo == "Miligram")
        _result = _inputUser / 1000;
      else if (_newValue == "Miligram" && _newValueTo == "Miligram")
        _result = _inputUser * 1;
      else if (_newValue == "Miligram" && _newValueTo == "Kilogram")
        _result = _inputUser / 1000000;
      else if (_newValue == "Miligram" && _newValueTo == "Gram")
        _result = _inputUser / 1000;
      else if (_newValue == "Miligram" && _newValueTo == "Ons")
        _result = _inputUser * 1000;
    });
    listViewItem.add("$_newValue : $_result");
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganMassa();
    });
  }

  void dropdownOnChangedTo(String changeValue) {
    setState(() {
      _newValueTo = changeValue;
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
                  dropdownKonversi(listItem: listItem,newValue: _newValue,dropdownOnChanged: dropdownOnChanged),
                  Input(inputUserController: inputController),
                  dropdownKonversiTo(listTo: listTo,newValueTo: _newValueTo,dropdownOnChangedTo: dropdownOnChangedTo),
              Result(result: _result),
              Convert(konvertHandler: perhitunganMassa),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "History Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded( //untuk memenuhi ruang kosong
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

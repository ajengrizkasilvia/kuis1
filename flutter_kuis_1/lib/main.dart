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
  double _inputUser = 0; //inisialisasi awal nilai variabel
  double _miligram = 0;
  double _kilogram = 0;
  double _gram = 0; //inisialisasi
  double _ons = 0;
  final inputController = TextEditingController(); //memanggil nilai variabel
  String _newValueTo = "Kilogram"; //default di dropdown
  String _newValue = "Kilogram";
  double _result = 0;

  List<String> listViewItem = List<String>(); //membuat variabel list bertipe string
  var listItem = ["Kilogram", "Gram", "Ons", "Miligram"]; //isi data list
  List<String> listTo = ["Kilogram", "Gram","Ons","Miligram"]; //isi data list dropdown To/bawah

  void perhitunganMassa() { //fungsi perhitungan
    setState(() {  //agar dapat dieksekusi berulang-ulang
      _inputUser = double.parse(inputController.text); //memanggil nilai dr controller kemudian dimasukkan ke input, kemudian mengkonversi dalam bentuk double
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
    listViewItem.add("$_newValueTo : $_result"); //menampilkan ke hasil kemudian dimasukkan ke riwayat
  }

  void dropdownOnChanged(String changeValue) { //fungsi dropdown 
    setState(() { //agar dapat dieksekusi berulang
      _newValue = changeValue; //menyimpan nilai value baru yg dipilih user
      perhitunganMassa(); //memanggil fungsi perhitungan
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
    return MaterialApp( //basic app element
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold( //untuk mengatur tata letak 
        appBar: AppBar(  //header
          title: Text("Konverter Massa"),
        ),
        body: Container( //menampung berbagai macam atribut
          margin: EdgeInsets.all(8), //mengatur jarak container dengan widget
          child: Column( //menampung widget seperti colomn,row,text
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //mengatur kolom (vertikal)
            children: [ //array of list
                  dropdownKonversi(listItem: listItem,newValue: _newValue,dropdownOnChanged: dropdownOnChanged), //menjadikan widget lebih sederhana //parameter
                  Input(inputUserController: inputController), //menjadikan widget lebih sederhana
                  dropdownKonversiTo(listTo: listTo,newValueTo: _newValueTo,dropdownOnChangedTo: dropdownOnChangedTo), //menjadikan widget lebih sederhana
              Result(result: _result), //menjadikan widget lebih sederhana
              Convert(konvertHandler: perhitunganMassa), //menjadikan widget lebih sederhana
              Container( //menampung atribut 
                margin: EdgeInsets.only(top: 10, bottom: 10), //mengatur jarak dengan widget
                child: Text( //menampung widget
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

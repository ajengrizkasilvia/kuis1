import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dropdownKonversi extends StatelessWidget {
  const dropdownKonversi({
    Key key,
    @required this.listItem,
    @required String newValue, //isi parameter dr konstruktor
    @required this.dropdownOnChanged,
  }) : _newValue = newValue, super(key: key); //inisialisasi sbg subclass agar dapat memanggil class main

  final List<String> listItem; //deklarasi bertipe data array
  final String _newValue; //deklarasi bertipe data string
  final Function dropdownOnChanged; //deklarasi fungsi dropdown

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>( //memanggil dropdown di main
      items: listItem.map((String value) { //iterasi utk setiap item dr list item, map-> menampilkan hasil setiap item yg ada dlm list item
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(), //menampilkan yg dipilih dari menu item yg berurutan
      value: _newValue,
      onChanged: dropdownOnChanged, //agar dropdown dapat diganti
    );
  }
}
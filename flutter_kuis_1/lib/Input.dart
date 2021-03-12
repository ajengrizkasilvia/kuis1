import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({ //konstruktor 
    Key key,
    @required this.inputUserController, //isi parameter konstruktor
  }) : super(key: key); //id kelas, inisialisasi sebagai sub class dari class main

  final TextEditingController inputUserController; //deklarasi konstruktor untuk controller

  @override
  Widget build(BuildContext context) {
    return TextFormField( //form inputan
        controller: inputUserController, //menerima inputan user
        decoration: InputDecoration(
          hintText: 'Masukkan Massa',
        ),
        keyboardType: TextInputType.numberWithOptions(), //type text input agar berupa angka 
        validator: (String value) { //memvalidasi inputan user
          if (value.isEmpty) { //kondisi
            return 'Enter some text';
          }
          return null;
        });
  }
}
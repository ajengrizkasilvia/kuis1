import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.result, //isi parameter konstruktor
  }) : super(key: key);
  final double result; //final -> deklarasi variabel pada konstruktor
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(1), //menampilkan hasil agar nilainya 1 dibelakang koma
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

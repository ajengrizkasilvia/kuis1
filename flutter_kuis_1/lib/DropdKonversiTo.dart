import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dropdownKonversiTo extends StatelessWidget {
  const dropdownKonversiTo({
    Key key,
    @required this.listTo,
    @required String newValueTo,
    @required this.dropdownOnChangedTo,
  }) : _newValueTo = newValueTo, super(key: key);

  final List<String> listTo;
  final String _newValueTo;
  final Function dropdownOnChangedTo;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listTo.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValueTo,
      onChanged: dropdownOnChangedTo,
    );
  }
}
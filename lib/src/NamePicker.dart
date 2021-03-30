import 'dart:core';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';

class NamePicker extends StatefulWidget {
  @override
  _NamePickerState createState() => _NamePickerState();
}

class _NamePickerState extends State<NamePicker> {

  String _nameSelected;
  List<DropdownMenuItem<String>> _clientNames;

  void pickUser() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    _clientNames = List.empty(growable: true);
    _clientNames.add(
      DropdownMenuItem(child: Text("Carter"), value: "Carter",)
    );
    // TODO: implement build
    return Center(
      child: SearchableDropdown.single(
          items: _clientNames,
          onChanged: (value) {
            setState(() {
              _nameSelected = value;
            });
          },
          isExpanded: true,
      ),
    );
  }
}
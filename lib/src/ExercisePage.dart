import 'dart:core';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({Key key}) : super(key: key);
  @override
  _ExercisePage createState() => _ExercisePage();
}

class _ExercisePage extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exercise')
      ),
      body: Center(
        child: Text('stuff')
      )
    );
  }

}
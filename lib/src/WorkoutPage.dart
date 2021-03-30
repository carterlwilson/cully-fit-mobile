import 'dart:core';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({Key key}) : super(key: key);
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Page")
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          ),
          Center(
            child: Center(
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/exercise');
                },
              ),
            ),
          )
        ],
      )
    );
  }

}
import 'dart:async';
import 'dart:core';
import 'package:cully_strength_app/src/Models/Exercise.dart';
import 'package:cully_strength_app/src/Widgets/ExerciseCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ExercisePage extends StatefulWidget {
  final Exercise exercise;

  ExercisePage({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExercisePage createState() => _ExercisePage();
}

class _ExercisePage extends State<ExercisePage> {

  int? _setsCompleted = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exercise')
      ),
      body: Center(
        child: ExerciseCard(exercise: widget.exercise)
      )
    );
  }

}
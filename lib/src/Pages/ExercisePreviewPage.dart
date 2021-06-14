import 'dart:core';
import 'package:cully_strength_app/src/Models/Day.dart';
import 'package:cully_strength_app/src/Widgets/ExerciseCard.dart';
import 'package:cully_strength_app/src/Widgets/ExercisePreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ExercisePreviewPage extends StatelessWidget {

  final Day? dayInfo;
  final Day? dayInfo2;
  final String? name1;
  final String? name2;
  const ExercisePreviewPage({
    Key? key,
    required this.dayInfo,
    required this.dayInfo2,
    required this.name1,
    required this.name2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout"),
      ),
      body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            //padding: EdgeInsets.symmetric(horizontal: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$name1",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          dayInfo!.exercises.length, (index) {
                        return ExerciseCard(exercise: dayInfo!.exercises[index]);
                      }
                      )
                  ),
                ),
                if (dayInfo2 != null)
                  Text(
                    "$name2",
                    style: TextStyle(fontSize: 30),
                  ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          dayInfo2!.exercises.length, (index) {
                        return ExerciseCard(exercise: dayInfo2!.exercises[index]);
                      }
                      )
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
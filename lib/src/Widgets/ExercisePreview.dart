import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Pages/ExercisePage.dart';
import '../Models/Exercise.dart';

class ExercisePreview extends StatelessWidget {
  final Exercise exerciseInfo;
  const ExercisePreview({Key? key, required this.exerciseInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  exerciseInfo.name,
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${exerciseInfo.sets} sets x ${exerciseInfo.reps} reps",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExercisePage(exercise: exerciseInfo))
                    );
                  },
                  child: Text(
                    "START",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
import 'package:cully_strength_app/src/Models/Exercise.dart';

class Day {
  Day({
    required this.exercises
  });

  List<Exercise> exercises;

  Day.fromJson(Map<String, dynamic> json)
    : exercises = new List<Exercise>.empty(growable: true)
  {
    exercises = convertToExerciseList(json["Exercises"]);
  }

  static List<Exercise> convertToExerciseList(List<dynamic>? map) {
    var tempList = new List<Exercise>.empty(growable: true);
    map!.forEach((value) {
      var exercise = Exercise.fromJson(value);
      tempList.add(exercise);
    });
    return tempList;
  }
}
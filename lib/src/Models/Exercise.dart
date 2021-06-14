import 'dart:ffi';

class Exercise {
  Exercise({
    required this.name,
    required this.multiplier,
    required this.sets,
    required this.reps,
    required this.max
  });

  final String name;
  final double multiplier;
  final int sets;
  final int reps;
  final int max;

  Exercise.fromJson(Map<String, Object?> json)
    :this(
      name: json["Name"] as String,
      multiplier: json["Multiplier"] as double,
      sets: json["Sets"] as int,
      reps: json["Reps"] as int,
      max: json["Max"] as int
    );
}
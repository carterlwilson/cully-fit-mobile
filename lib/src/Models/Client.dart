import 'package:cully_strength_app/src/Models/CurrentMultipliers.dart';
import 'package:cully_strength_app/src/Models/Multipliers.dart';
import 'package:flutter/cupertino.dart';

class Client {
  Client({
    required this.firstName,
    required this.lastName,
    required this.currentMultipliers,
    required this.multipliers
  });

  Client.fromJson(Map<String, dynamic?> json)
    :this(
      firstName: json['FirstName']! as String,
      lastName: json['LastName']! as String,
      currentMultipliers: CurrentMultipliers.fromJson(json['CurrentMultipliers']!),
      multipliers: Multipliers.fromJson(json['Multipliers']!)
    );

  final String firstName;
  final String lastName;
  final CurrentMultipliers currentMultipliers;
  final Multipliers multipliers;

  Map<String, Object?> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
    };
  }

  String toNameString() {
    return firstName + " " + lastName;
  }

  bool compareClients(Client? client) {
    if (lastName.compareTo(client!.lastName) < 0) {
      return true;
    }
    else return false;
  }

}
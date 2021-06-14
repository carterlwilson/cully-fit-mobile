import 'dart:ffi';

import 'package:cully_strength_app/src/Models/Block.dart';
import 'package:flutter/cupertino.dart';

class Multipliers {
  Multipliers({
    required this.multipliers,
  });

  Multipliers.fromJson(Map<String, dynamic> json)
    : multipliers = new List<Block>.empty(growable: true)
  {
    multipliers= convertToBlockList(json['Blocks']);
  }


  static List<Block> convertToBlockList(List<dynamic>? map) {
    var tempList = new List<Block>.empty(growable: true);
    map!.forEach((value) {
      var block = Block.fromJson(value);
      tempList.add(block);
    });
    return tempList;
  }

  List<Block> multipliers;
}
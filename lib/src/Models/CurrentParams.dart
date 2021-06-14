import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class CurrentParams {
  CurrentParams({
    required this.block,
    required this.week
  });

  CurrentParams.fromJson(Map<String, Object?> json)
    :this(
      block: json['Block'] as int,
      week: json['Week'] as int
    );

  final int block;
  final int week;
}
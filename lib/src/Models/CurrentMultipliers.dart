class CurrentMultipliers {
  CurrentMultipliers({
    required this.block,
    required this.week
  });

  final int block;
  final int week;

  CurrentMultipliers.fromJson(Map<String, Object?> json)
      :this(
        block: json['Block']! as int,
        week: json['Week']! as int
      );
}
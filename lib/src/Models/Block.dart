import 'Week.dart';

class Block {
  Block({
    required this.weeks
  });

  List<Week> weeks;

  Block.fromJson(Map<String, dynamic> json)
    : weeks = new List<Week>.empty(growable: true)
  {
    weeks = convertToWeekList(json["Weeks"]);
  }

  static List<Week> convertToWeekList(List<dynamic>? map) {
    var tempList = new List<Week>.empty(growable: true);
    map!.forEach((value) {
      var week = Week.fromJson(value);
      tempList.add(week);
    });
    return tempList;
  }
}
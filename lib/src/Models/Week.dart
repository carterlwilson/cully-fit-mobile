import 'Day.dart';

class Week {
  Week({
    required this.days
  });

  List<Day> days;

  Week.fromJson(Map<String, dynamic> json)
    : days = new List<Day>.empty(growable: true)
  {
    days = convertToDayList(json["Days"]);
  }

  static List<Day> convertToDayList(List<dynamic>? map) {
    var tempList = new List<Day>.empty(growable: true);
    map!.forEach((value) {
      var day = Day.fromJson(value);
      tempList.add(day);
    });
    return tempList;
  }
}
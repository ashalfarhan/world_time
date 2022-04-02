import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  final baseUrl = 'http://worldtimeapi.org/api';

  late String time;
  late bool isDayTime;
  String location;
  String timezone;
  String flag;

  WorldTime({
    required this.location,
    required this.timezone,
    required this.flag,
  });

  Future<void> getTime() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/timezone/$timezone"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Failed to get time for $timezone $e");
      time = "Couldn't get time";
    }
  }
}

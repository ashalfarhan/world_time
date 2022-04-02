import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

List<WorldTime> locations = [
  WorldTime(
      timezone: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  WorldTime(
      timezone: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(timezone: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(timezone: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(timezone: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  WorldTime(timezone: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(timezone: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(timezone: 'Europe/London', location: 'London', flag: 'uk.png'),
];

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  void updateTime(int index) async {
    final selected = locations[index];
    await selected.getTime();
    Navigator.pop(
      context,
      {
        'isDayTime': selected.isDayTime,
        'timezone': selected.timezone,
        'location': selected.location,
        'flag': selected.flag,
        'time': selected.time,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 1.0,
            ),
            child: Card(
              elevation: 0,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

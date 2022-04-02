import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const baseUrl = 'http://worldtimeapi.org/api';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Jakarta',
      timezone: 'Asia/Jakarta',
      flag: 'jakarta.png',
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'isDayTime': instance.isDayTime,
        'location': instance.location,
        'timezone': instance.timezone,
        'time': instance.time,
        'flag': instance.flag,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitRing(
          color: Colors.greenAccent,
          size: 50.0,
        ),
      ),
    );
  }
}

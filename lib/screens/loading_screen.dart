import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.latitude);
  print(location.longitude);
}

void getCurrentData() async {
  Location location = Location();
  await location.getData();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getCurrentData();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}

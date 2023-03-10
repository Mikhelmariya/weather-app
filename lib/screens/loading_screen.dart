import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  late double latitude;
  late double longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=2b7e8b388ef080587c5f37ee2db905dd");
    var weatherdata = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(locationweather: weatherdata,);
      },
    ));

    
    // print(temp);
    // print(weatherDesc);
    // print(longitude);
    // print(name);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100,
        )),
      ),
    );
  }
}

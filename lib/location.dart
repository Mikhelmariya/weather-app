import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //  convert json

class Location {
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    String urlString =
        "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=2b7e8b388ef080587c5f37ee2db905dd";
    Uri uri = Uri.parse(urlString);
    http.Response response = await http.get(uri);
    String data = response.body;
    var longitude = jsonDecode(data)['coord']['lon'];
    var weatherDesc = jsonDecode(data)['weather'][0]['main'];
    var temp = jsonDecode(data)["main"]['temp'];
    var name = jsonDecode(data)['name'];
    print(temp);
    print(weatherDesc);
    print(longitude);
    print(name);
    //print(response.body.toString());
  }
}

//void getCurrentLocation() async {}


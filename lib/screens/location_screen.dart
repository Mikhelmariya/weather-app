import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late double name;
  late double desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationweather);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

void updateUI(dynamic weatherdata) {
  var weatherDesc = weatherdata['weather'][0]['main'];
  var temp = weatherdata["main"]['temp'];
  var name = weatherdata['name'];
  print(temp);
  print(name);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Text("Weather Details")),
    );
  }
}

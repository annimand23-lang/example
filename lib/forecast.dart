import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<StatefulWidget> createState() => ForecastState();
}

class ForecastState extends State<Forecast> {
@override
void initState() {
  super.initState();
  _getLocation().then((position){
    debugPrint('Location: $position');
  });
}

  Future<Position> _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission == await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location is not available');
    } 
    return await GeolocatorPlatform.instance.getCurrentPosition();
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Forest'),),
      );
  
  }
}
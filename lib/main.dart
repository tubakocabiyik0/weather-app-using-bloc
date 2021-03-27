import 'package:flutter/material.dart';
import 'package:wheather_app_bloc/widget/weather_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

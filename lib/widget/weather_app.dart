import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app_bloc/widget/search_widget.dart';
import 'last_time.dart';
import 'location.dart';
import 'max_min.dart';
import 'weather_image.dart';

class WeatherApp extends StatefulWidget {
  String cityName;

  WeatherApp({@required this.cityName});
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.cityName);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async{
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchWidget()));
              }),
        ],
        title: Text(" Weather App"),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(child: LocationWidget(widget.cityName)),

            Center(
              child: LastTimeWidget(),
            ),
            Center(
              child: WeatherImageWidget(),
            ),
            Center(
              child: MaxMinWidget(),
            )
          ],
        ),
      ),
    );
  }
}

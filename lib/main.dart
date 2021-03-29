import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';
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
      home: BlocProvider<WeatherBloc>(
          create:(context)=> WeatherBloc(),
          child: WeatherApp()),
    );
  }
}

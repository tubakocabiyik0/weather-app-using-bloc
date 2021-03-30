import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';
import 'package:wheather_app_bloc/bloc_theme/theme_bloc.dart';
import 'package:wheather_app_bloc/widget/weather_app.dart';

void main() {
  runApp(BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder:(context,ThemeState state){
      return MaterialApp(
        theme: (state as ThemeLoaded).themeData ,
        debugShowCheckedModeBanner: false,
        home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(), child: WeatherApp()),
      );
    });
  }
}

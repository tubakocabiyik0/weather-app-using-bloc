import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
           var weatherState= (state as WeatherLoaded).weather.consolidatedWeather[0].weatherStateAbbr;
          return Image.network("https://www.metaweather.com/static/img/weather/png/$weatherState.png",width: 100,height: 100,);
        },
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';

class MaxMinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return BlocBuilder<WeatherBloc,WeatherState>(builder:(context,state){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Maximum : "+ (state as WeatherLoaded).weather.consolidatedWeather[0].maxTemp.toString() , style: TextStyle(fontSize: 22)),
          Text("Minimum : " + (state as WeatherLoaded).weather.consolidatedWeather[0].minTemp.toString(), style: TextStyle(fontSize: 22)),
        ],
      );
    }


    );
  }
}

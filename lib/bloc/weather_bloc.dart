import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wheather_app_bloc/model/weather.dart';

import 'repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());
  WeatherRepo weatherRepo = WeatherRepo();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather)  {
      yield WeatherLoading();

      try  {
        final getWeather = await weatherRepo.getWeather(event.cityName);
        yield WeatherLoaded(getWeather);
      } catch (e) {
        debugPrint(e.toString());
        yield WeatherError();
      }
    }
  }
}

part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  @override
  List<Object> get props => [props];
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  //weather model class
  final Weather weather;

  WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}



class WeatherError extends WeatherState {
  @override
  List<Object> get props => [];
}

part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  List<Object> get props => [props];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState{}

class WeatherLoaded extends WeatherState{
  //weather model class
  final Weather weather;

  WeatherLoaded(this.weather);

}
class WeatherError extends WeatherState{}

part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {

  @override
  List<Object> get props => [props];
}

class FetchWeather extends WeatherEvent{
  final String cityName;

  FetchWeather({@required  this.cityName});

  @override
  List<Object> get props => [cityName];

}

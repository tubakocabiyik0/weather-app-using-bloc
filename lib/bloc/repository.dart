import 'package:wheather_app_bloc/model/get_data.dart';
import 'package:wheather_app_bloc/model/weather.dart';

class WeatherRepo {
  GetData getData = GetData();

  Future<Weather> getWeather(String city) async {
    int Cityid = (await getData.getCityId(city)) as int;
    return await getData.getData(Cityid);
  }
}

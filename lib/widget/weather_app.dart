import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';
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
  String city;
  @override
  Widget build(BuildContext context) {
    final _weather = Provider.of<WeatherBloc>(context);


    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                city=await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchWidget()));
                if(city!=null){
                  _weather.add(FetchWeather(cityName:city));
                }
              }),
        ],
        title: Text(" Weather App"),
      ),
      body: Center(child: BlocBuilder<WeatherBloc,WeatherState>(builder: (context, state) {
        if(state is WeatherInitial){
          return Text("choose city");
        }
        else if (state is WeatherLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherLoaded) {
          final weather=state.weather;
          return ListView(
            children: [
              Center(child: LocationWidget(weather.title)),
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
          );
        } else if (state is WeatherError) {
          return Text("erros");
        }
      })),
    );
  }
}

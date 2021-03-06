import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';
import 'package:wheather_app_bloc/bloc_theme/theme_bloc.dart';
import 'package:wheather_app_bloc/widget/color_change.dart';
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
    Completer _completer = Completer();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  city = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchWidget()));
                  if (city != null) {
                    _weather.add(FetchWeather(cityName: city));
                  }
                }),
          ],
          title: Text(" Weather App"),
        ),
        body: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return ColorChange((state as ThemeLoaded).materialColor, Center(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return Text("choose city");
                    }
                    else if (state is WeatherLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is WeatherLoaded) {
                      final weather = state.weather;
                      String states = state.weather.consolidatedWeather[0]
                          .weatherStateAbbr;
                      Provider.of<ThemeBloc>(context).add(
                          ChangeTheme(WState: states));


                      _completer.complete();
                      _completer = Completer();
                      return RefreshIndicator(
                        onRefresh: () {
                          _weather.add(RefreshWeather(cityName: city));
                          return _completer.future;
                        },
                        child: ListView(
                          children: [
                            Center(child: LocationWidget(weather.title)),
                            Center(
                              child: LastTimeWidget(),
                            ),
                            Center(
                              child: WeatherImageWidget(),
                            ),
                            Center(
                              child: Expanded(child: MaxMinWidget()),
                            )
                          ],
                        ),
                      );
                    } else if (state is WeatherError) {
                      return Text("erros");
                    }
                  })),);
        },
        )
    );
  }
}

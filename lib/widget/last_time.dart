import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app_bloc/bloc/weather_bloc.dart';

class LastTimeWidget extends StatefulWidget {
  @override
  _LastTimeWidgetState createState() => _LastTimeWidgetState();
}

class _LastTimeWidgetState extends State<LastTimeWidget> {
  @override
  Widget build(BuildContext context) {
    final _weather = BlocProvider.of<WeatherBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<WeatherBloc,WeatherState>(
          builder: (context, state) {
            var time=(state as WeatherLoaded).weather.time.toLocal();
            return
              Text(
                "Time: "+ TimeOfDay.fromDateTime(time).format(context),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              );
          }

      ),
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLoaded(themeData:ThemeData.light(),materialColor:Colors.blue.shade100));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    ThemeLoaded themeLoaded;
    if (event is ChangeTheme) {
      switch (event.WState) {
        case "sn":
        case "sl":
        case "h":
        case "t":
        case "hc":
          themeLoaded = ThemeLoaded(themeData: ThemeData(primaryColor: Colors.blueGrey),materialColor: Colors.grey);
          break;

        case "hr":
        case "lr":
        case "s":
          themeLoaded = ThemeLoaded(themeData: ThemeData(primaryColor: Colors.blueAccent),materialColor:Colors.blueAccent.shade100);
          break;

        case "lc":
        case "c":
          themeLoaded = ThemeLoaded(themeData:
              ThemeData(primaryColor: Colors.orange), materialColor:Colors.yellow);
          break;
      }
      yield themeLoaded;
    }
  }
}

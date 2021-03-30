part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  @override
  List<Object> get props => [props];
}

class ThemeLoaded extends ThemeState{
  final ThemeData themeData;
  final Color materialColor;
  ThemeLoaded({this.themeData, this.materialColor});

  @override
  List<Object> get props => [themeData,materialColor];
}


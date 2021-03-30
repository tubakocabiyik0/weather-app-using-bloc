part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [props];
}

class ChangeTheme extends ThemeEvent{
  final String WState;

  ChangeTheme({ this.WState});

  @override
  List<Object> get props => [WState];
}
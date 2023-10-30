part of 'weather_app_bloc.dart';

sealed class WeatherAppEvent extends Equatable {
  const WeatherAppEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherAppEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}

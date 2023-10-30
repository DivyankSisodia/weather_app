import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_app_event.dart';
part 'weather_app_state.dart';

class WeatherAppBloc extends Bloc<WeatherAppEvent, WeatherAppState> {
  WeatherAppBloc() : super(WeatherAppInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherAppLoading());
      try {
        WeatherFactory wf =
            WeatherFactory("249d86a2c9c4054341b794c0ca363077", language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherAppSuccess(weather));
      } catch (e) {
        emit(WeatherAppFailure());
      }
    });
  }
}

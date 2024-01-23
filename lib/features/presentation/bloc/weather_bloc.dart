import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';
import '../../data/data_source/remote.dart';
import '../../data/repository/weather.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/usecase/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc()
      : super(WeatherState(status: LoadingStatus.pure, weatherEntity: null)) {
    on<WeatherEventStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase =
      await GetWeatherInfoUseCase(WeatherRepositoryImpl(remoteDataSource: WeatherNetworkDataSource())).call(NoParams());


      usecase.either((failure) {
        emit(state.copyWith(status: LoadingStatus.failure));
      }, (weatherInfo) {
        print(weatherInfo);
        emit(state.copyWith(
            status: LoadingStatus.success, weatherEntity: weatherInfo));
      });
    });
  }
}

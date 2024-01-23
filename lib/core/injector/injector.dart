import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/data/data_source/remote.dart';
import '../../features/data/repository/weather.dart';
import '../../features/domain/usecase/weather.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );

  serviceLocator.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: 'https://api.weatherapi.com/v1')));
  serviceLocator.registerLazySingleton(() => WeatherNetworkDataSource());
  serviceLocator.registerLazySingleton(
      () => WeatherRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetWeatherInfoUseCase(serviceLocator()));
}

import 'package:imtohon_4/core/failure/failure.dart';
import 'package:imtohon_4/features/domain/entity/weather_entity.dart';
import 'package:imtohon_4/features/domain/repository/weather.dart';
import 'package:imtohon_4/core/either/either.dart';

import '../../../core/usecase/usecase.dart';

class GetWeatherInfoUseCase implements UseCase<WeatherEntity, NoParams>{
  final WeatherRepository _weatherRepository;
  GetWeatherInfoUseCase(WeatherRepository weatherRepository) : _weatherRepository = weatherRepository;

  @override
  Future<Either<Failure, WeatherEntity>> call (NoParams params) async {
    return await _weatherRepository.getWeather();
  }
}
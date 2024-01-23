import '../../../core/either/either.dart';
import '../../../core/failure/failure.dart';
import '../entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<ServerFailure, WeatherEntity>> getWeather();
}

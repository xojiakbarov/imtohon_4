


import '../../../core/either/either.dart';
import '../../../core/exception/exception.dart';
import '../../../core/failure/failure.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/repository/weather.dart';
import '../data_source/remote.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherNetworkDataSource _remoteDataSource;
  const WeatherRepositoryImpl(
      {required WeatherNetworkDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ServerFailure, WeatherEntity>> getWeather() async {
    try {
      final response = await _remoteDataSource.getWeather();
      print(response);
      return Right(WeatherEntity.toEntity(response));
    } on ServerException catch (exception) {
      return Left(ServerFailure.fromServerException(exception));
    }
  }
}
